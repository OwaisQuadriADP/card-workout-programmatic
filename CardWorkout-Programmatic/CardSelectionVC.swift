//
//  CardSelectionVC.swift
//  CardWorkout-Programmatic
//
//  Created by Quadri, Owais on 2022-10-25.
//

import UIKit

class CardSelectionVC: UIViewController {
    // UI components
    let cardImageView   = UIImageView()
    let stopButton      = CWButton("", is: .systemRed, on: .systemRed, with: "stop")
    let restartButton   = CWButton("", is: .systemGreen, on: .systemGreen, with: "play")
    let rulesButton     = CWButton("", is: .systemBlue, on: .systemBlue, with: "list.bullet")
    //timer
    var timer: Timer! // TODO: force unwrap for some reason (check vid for reason)
    var cards: [UIImage] = Card.allCards
    var isTimerRunning: Bool = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configureUI()
    }
    
    func configureUI(){
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
        view.backgroundColor = .systemBackground //white in light and black in dark
    }
    func configureCardImageView(){
        view.addSubview(cardImageView)//dragging onto the view
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: "AS")
        //cardImageView constraints
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    func configureStopButton(){
        view.addSubview(stopButton)//drag
        //CWButtons already have .traa false
        //name and color already configured
        //constraints
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 50),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -35),
            stopButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -25)
        ])
        //target
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
    }

    func configureRestartButton () {
        view.addSubview(restartButton)
        // traa = false
        // name/color
        //constraints
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 50),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 35),
            restartButton.centerYAnchor.constraint(equalTo: stopButton.centerYAnchor)
        ])
        //target
        restartButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
    }
    
    func configureRulesButton(){
        view.addSubview(rulesButton)
        // traa = false
        // name/color
        //constraints
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 50),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            rulesButton.centerYAnchor.constraint(equalTo: stopButton.centerYAnchor)
        ])
        //add target
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
    }
    @objc func presentRulesVC(){
        let rulesVC = RulesVC()
        //present means modal
        present(rulesVC, animated: true)
    }
    
    @objc func startTimer() {
        if isTimerRunning{
            stopTimer()
        }
        timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
        restartButton.configuration?.image = UIImage(systemName: "arrow.counterclockwise")
        isTimerRunning = true
    }
    @objc func stopTimer(){
        timer.invalidate()
        restartButton.configuration?.image = UIImage(systemName: "play")
    }
    @objc func showRandomCard(){
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
}
