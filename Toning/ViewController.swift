//
//  ViewController.swift
//  Toning
//
//  Created by Machir on 2021/7/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var shadowView: UIView!
    @IBOutlet weak var redSwitch: UISwitch!
    @IBOutlet weak var greenSwitch: UISwitch!
    @IBOutlet weak var blueSwitch: UISwitch!
    @IBOutlet weak var randomColorButton: UIButton!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    @IBOutlet weak var alphaSlider: UISlider!
    @IBOutlet weak var radiusSlider: UISlider!
    @IBOutlet weak var gradientSlider: UISlider!
    @IBOutlet weak var shadowSlider: UISlider!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var alphaLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func switchAction(_ sender: UISwitch) {
        if redSwitch.isOn {
            redSlider.isEnabled = true
        } else {
            redSlider.isEnabled = false
        }
        if greenSwitch.isOn {
            greenSlider.isEnabled = true
        } else {
            greenSlider.isEnabled = false
        }
        if blueSwitch.isOn {
            blueSlider.isEnabled = true
        } else {
            blueSlider.isEnabled = false
        }
        if redSwitch.isOn, greenSwitch.isOn, blueSwitch.isOn {
            randomColorButton.isEnabled = true
        } else {
            randomColorButton.isEnabled = false
        }
    }
    
    
    @IBAction func changeColorSlider(_ sender: UISlider) {
        imageView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: CGFloat(alphaSlider.value))
        
        redLabel.text = String(format: "%.2f", redSlider.value)
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        alphaLabel.text = String(format: "%.1f", alphaSlider.value)
    }
    
    @IBAction func randomButtonPress(_ sender: UIButton) {
        let red = Float.random(in: 0...1)
        let green = Float.random(in: 0...1)
        let blue = Float.random(in: 0...1)
        let alpha = Double.random(in: 0...1)
        
        imageView.backgroundColor = UIColor(red: CGFloat(red), green: CGFloat(green), blue: CGFloat(blue), alpha: CGFloat(alpha))
        
        redLabel.text = String(format: "%.2f", red)
        greenLabel.text = String(format: "%.2f", green)
        blueLabel.text = String(format: "%.2f", blue)
        alphaLabel.text = String(format: "%.1f", alpha)
        
        redSlider.value = Float(red)
        greenSlider.value = Float(green)
        blueSlider.value = Float(blue)
        alphaSlider.value = Float(alpha)
    }
    
    @IBAction func changeRadiusSlider(_ sender: UISlider) {
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = CGFloat(radiusSlider.value)
        shadowView.layer.cornerRadius = CGFloat(radiusSlider.value)
        gradientView.layer.cornerRadius = CGFloat(radiusSlider.value)
    }
    
    @IBAction func changeGradientSlider(_ sender: UISlider) {
        let gradientLayer = CAGradientLayer()
        let locationTop = round(30*gradientSlider.value)/30
        
        gradientLayer.colors = [UIColor.orange.cgColor, UIColor.yellow.cgColor]
        gradientLayer.frame = gradientView.bounds
        gradientLayer.locations = [0.0, NSNumber(value: locationTop)]
        gradientView.layer.addSublayer(gradientLayer)
        gradientView.clipsToBounds = true
    }
    
    @IBAction func changeShadowSlider(_ sender: UISlider) {
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowColor = UIColor.darkGray.cgColor
        shadowView.layer.shadowOffset = CGSize(width: 1, height: 1)
        shadowView.layer.shadowOpacity = 0.8
        shadowView.layer.shadowRadius = CGFloat(shadowSlider.value)
    }
    
}

