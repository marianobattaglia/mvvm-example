//
//  OptionsViewController.swift
//  GoodNews
//
//  Created by Mariano Martin Battaglia on 15/02/2023.
//

import UIKit

class OptionsViewController: UIViewController {
    
    // MARK: - Properties
    @IBOutlet weak var countryPicker: UIPickerView!
    private var pickerData: [String] = [String]()
    private var delegate: NewsListOptionsProtocol?
    private var pickerHasChange: Bool = false
    
    // MARK: - Lifecycle
    init(delegate: NewsListOptionsProtocol) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = delegate
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countryPicker.delegate = self
        self.countryPicker.dataSource = self
        
        pickerData = ["United States", "Argentina", "Brasil"]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        if pickerHasChange {
            delegate?.updateList()
        } else {
            delegate?.updateCountry(to: "United States")
            delegate?.updateList()
        }
    }
    
    @IBAction func doneBtnPressed(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        dismiss(animated: true)
    }
    
}

extension OptionsViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    /// Columns
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    /// Numbers of rows
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    /// Title for row
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let newCountry = pickerData[row]
        delegate?.updateCountry(to: newCountry)
        
        self.pickerHasChange = true
    }
    
}
