//
//  NewWorkoutVC.swift
//  MyXWorkout
//
//  Created by Test on 07/08/22.
//

import UIKit
import RealmSwift

class NewWorkoutVC: UIViewController {

    private let statisticImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "statisticImage")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let newWorkoutLabel: UILabel = {
       let label = UILabel()
        label.text = "NEW WORKOUT"
        label.font = .robotoBold24()
        label.textColor = .specialLogo
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(systemName: "clear.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let nameTextField: UITextField = {
       let textField = UITextField()
        textField.backgroundColor = .textFieldColor
        textField.borderStyle = .none
        textField.layer.cornerRadius = 10
        textField.textColor = .specialGray
        textField.font = .robotoBold20()
        textField.leftView = UIView(frame: CGRect(x: 0,
                                                  y: 0,
                                                  width: 15,
                                                  height: textField.frame.height))
        textField.leftViewMode = .always
        textField.clearButtonMode = .always
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var  saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = .specialGreen
        button.setTitle("SAVE", for: .normal)
        button.titleLabel?.font = .robotoBold16()
        button.tintColor = .white
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(saveButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let nameLabel = UILabel(text: "Name")
    private let dateAndRepeatLabel = UILabel(text: "Date and repeat")
    private let repsOrTimerLabel = UILabel(text: "Reps or timer")
    
    private let testImage = UIImage(named: "testWorkout")
    
    private let dateAndRepeatView = DateAndRepeatView()
    private let repsOrTimerView = RepsOrTimerView()
    
//    private let localRealm = try! Realm()
    private var workoutModel = WorkoutModel()
    
    
    
    override func viewDidLayoutSubviews() {
        closeButton.layer.cornerRadius = closeButton.frame.width / 2
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        setDelegates()
        setConstraints()
        addTaps()
    }
    
    private func setupViews() {
        
        view.addSubview(statisticImage)
        
        view.addSubview(newWorkoutLabel)
        view.addSubview(closeButton)
        view.addSubview(nameLabel)
        view.addSubview(nameTextField)
        nameTextField.addShadowOnView()
        view.addSubview(dateAndRepeatLabel)
        view.addSubview(dateAndRepeatView)
        dateAndRepeatView.addShadowOnView()
        view.addSubview(repsOrTimerLabel)
        view.addSubview(repsOrTimerView)
        repsOrTimerView.addShadowOnView()
        view.addSubview(saveButton)
        saveButton.addShadowOnView()
    }
    
    private func setDelegates() {
        nameTextField.delegate = self
    }
    
    
    
    @objc private func closeButtonTapped() {
        dismiss(animated: true)
    }
    
    @objc private func saveButtonTapped() {
        setModel()
        saveModel()
    }
    
    private func setModel() {
        guard let nameWorkout = nameTextField.text else { return }
        workoutModel.workoutName = nameWorkout
        
        let dateFromPicker = dateAndRepeatView.setDateAndRepeat().0
        
        workoutModel.workoutDate = dateFromPicker
        workoutModel.workoutNumberOfDay = dateFromPicker.getWeekdayNumber()
        workoutModel.workoutRepeat = dateAndRepeatView.setDateAndRepeat().1
        
        workoutModel.workoutSets = repsOrTimerView.setSliderValue().0
        workoutModel.workoutReps = repsOrTimerView.setSliderValue().1
        workoutModel.workoutTimer = repsOrTimerView.setSliderValue().2
        
        guard let imageData = testImage?.pngData() else { return }
        workoutModel.workoutImage = imageData
    }
    
    private func saveModel() {
        guard let text = nameTextField.text else { return }
        let count = text.filter { $0.isNumber || $0.isLetter }.count

        if count != 0 &&
            workoutModel.workoutSets != 0 &&
            (workoutModel.workoutReps != 0 || workoutModel.workoutTimer != 0) {
            RealmManager.shared.saveWorkoutModel(model: workoutModel)
            createNotifications()
            workoutModel = WorkoutModel()
            alertOk(title: "Success", message: nil)
            refreshObjects()
        } else {
            alertOk(title: "Error", message: "Enter all parameters")
        }
    }
    
    private func refreshObjects() {
        dateAndRepeatView.refreshDatePickerAndSwitch()
        repsOrTimerView.refreshLabelsAndSliders()
        nameTextField.text = ""
    }
    
    private func addTaps() {
        let tapScreen = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tapScreen)
        
        let swipeScreen = UISwipeGestureRecognizer(target: self, action: #selector(swipeHideKeyboard))
        swipeScreen.cancelsTouchesInView = false
        view.addGestureRecognizer(swipeScreen)
    }

    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
    
    @objc private func swipeHideKeyboard() {
        view.endEditing(true)
    }
    
    private func createNotifications() {
        let notifications = Notifications()
        let stringDate = workoutModel.workoutDate.ddMMyyyyFromDate()
        notifications.scheduleDateNotification(date: workoutModel.workoutDate, id: "workout" + stringDate)
        
    }
}

//MARK: - UITextFieldDelegate

extension NewWorkoutVC: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.resignFirstResponder()
    }
}

//MARK: - SetConstraints
extension NewWorkoutVC {
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            statisticImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            statisticImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            statisticImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            statisticImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            
            newWorkoutLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            newWorkoutLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            closeButton.centerYAnchor.constraint(equalTo: newWorkoutLabel.centerYAnchor),
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: newWorkoutLabel.bottomAnchor, constant: 10),
            nameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            nameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 3),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 38)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeatLabel.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
            dateAndRepeatLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            dateAndRepeatLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            dateAndRepeatView.topAnchor.constraint(equalTo: dateAndRepeatLabel.bottomAnchor, constant: 3),
            dateAndRepeatView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            dateAndRepeatView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            dateAndRepeatView.heightAnchor.constraint(equalToConstant: 94)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimerLabel.topAnchor.constraint(equalTo: dateAndRepeatView.bottomAnchor, constant: 20),
            repsOrTimerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            repsOrTimerLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            repsOrTimerView.topAnchor.constraint(equalTo: repsOrTimerLabel.bottomAnchor, constant: 3),
            repsOrTimerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            repsOrTimerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            repsOrTimerView.heightAnchor.constraint(equalToConstant: 320)
        ])
        
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: repsOrTimerView.bottomAnchor, constant: 20),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 55)
        ])
    }
}
