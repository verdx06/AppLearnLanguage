//
//  WordGameView.swift
//  AppLearnLanguage
//
//  Created by Виталий Багаутдинов on 26.03.2025.
//

import SwiftUI

// Модель для слова и его перевода
struct WordPair {
    let word: String
    let correctTranslation: String
    let wrongTranslations: [String]
}

// Главная вьюха игры
struct WordGameView: View {
    
    let systemLanguage = Locale.current.language
    
    
    // Массив слов и переводов (можешь добавить свои)
    let wordPairs = [
        WordPair(word: "Apple", correctTranslation: "Яблоко", wrongTranslations: ["Груша", "Банан", "Апельсин"]),
        WordPair(word: "Car", correctTranslation: "Машина", wrongTranslations: ["Самолет", "Корабль", "Велосипед"]),
        WordPair(word: "Sun", correctTranslation: "Солнце", wrongTranslations: ["Луна", "Звезда", "Облако"])
    ]
    
    // Текущее слово
    @State private var currentWordPair: WordPair?
    // Варианты ответов
    @State private var answerOptions: [String] = []
    // Счет игрока и компьютера
    @State private var playerScore = 0
    @State private var computerScore = 0
    // Показ результата (кто угадал)
    @State private var showResult = false
    @State private var resultMessage = ""
    // Текущий раунд
    @State private var currentRound = 1
    // Макс. раундов
    let maxRounds = 5
    
    // Выбранный игроком ответ
    @State private var playerSelectedAnswer: String?
    // "Выбранный" компьютером ответ
    @State private var computerSelectedAnswer: String?
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Игрок vs Компьютер")
                .font(.largeTitle)
                .padding()
            
            Text("Раунд \(currentRound)/\(maxRounds)")
                .font(.headline)
            
            if let currentWordPair = currentWordPair {
                Text("Слово: \(currentWordPair.word)")
                    .font(.title)
                
                // Кнопки с вариантами ответов (игрок выбирает)
                ForEach(answerOptions, id: \.self) { option in
                    Button(action: {
                        playerSelectedAnswer = option
                        checkAnswer(selectedTranslation: option)
                    }) {
                        Text(option)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(getButtonColor(option: option))
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .disabled(showResult)
                }
            } else {
                if currentRound <= maxRounds {
                    Button("Начать раунд") {
                        startNewRound()
                    }
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                } else {
                    Text("Игра окончена!")
                        .font(.title)
                    Text("Игрок: \(playerScore) | Компьютер: \(computerScore)")
                        .font(.headline)
                    
                    Button("Заново") {
                        resetGame()
                    }
                    .padding()
                    .background(Color.orange)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                }
            }
            
            if showResult {
                Text(resultMessage)
                    .font(.headline)
                    .padding()
                
                Button("Дальше") {
                    showResult = false
                    playerSelectedAnswer = nil
                    computerSelectedAnswer = nil
                    if currentRound <= maxRounds {
                        startNewRound()
                    }
                }
                .padding()
                .background(Color.purple)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            
            HStack {
                Text("Игрок: \(playerScore)")
                Text("Компьютер: \(computerScore)")
            }
            .font(.headline)
        }
        .padding()
        .onAppear {
            startNewRound()
        }
    }
    
    // Определяем цвет кнопки
    func getButtonColor(option: String) -> Color {
        guard showResult else { return Color.blue }
        
        if option == playerSelectedAnswer && option == computerSelectedAnswer {
            return Color.purple // Если оба выбрали этот вариант
        } else if option == playerSelectedAnswer {
            return option == currentWordPair?.correctTranslation ? Color.green : Color.red
        } else if option == computerSelectedAnswer {
            return Color.orange
        } else if option == currentWordPair?.correctTranslation {
            return Color.green
        }
        
        return Color.blue
    }
    
    // Начинаем новый раунд
    func startNewRound() {
        currentWordPair = wordPairs.randomElement()
        if let currentWordPair = currentWordPair {
            // Смешиваем правильный и неправильные переводы
            answerOptions = (currentWordPair.wrongTranslations + [currentWordPair.correctTranslation]).shuffled()
        }
    }
    
    // Проверяем ответ игрока и "ответ" компьютера
    func checkAnswer(selectedTranslation: String) {
        guard let currentWordPair = currentWordPair else { return }
        
        let isPlayerCorrect = selectedTranslation == currentWordPair.correctTranslation
        
        // Компьютер "угадывает" с вероятностью 20% (шанс победы 20%)
        let isComputerCorrect = Bool.random(probability: 0.2)
        
        // Компьютер выбирает ответ
        computerSelectedAnswer = isComputerCorrect ?
            currentWordPair.correctTranslation :
            answerOptions.filter { $0 != currentWordPair.correctTranslation }.randomElement()
        
        if isPlayerCorrect {
            playerScore += 1
            resultMessage = "Ты угадал! +1 очко"
        } else {
            resultMessage = "Ты ошибся! Правильно: \(currentWordPair.correctTranslation)"
        }
        
        if isComputerCorrect {
            computerScore += 1
            resultMessage += "\nКомпьютер угадал! +1 ему"
        } else {
            resultMessage += "\nКомпьютер лажанулся!"
        }
        
        showResult = true
        currentRound += 1
    }
    
    // Сброс игры
    func resetGame() {
        playerScore = 0
        computerScore = 0
        currentRound = 1
        showResult = false
        playerSelectedAnswer = nil
        computerSelectedAnswer = nil
        startNewRound()
    }
}

// Расширение для вероятностного рандома
extension Bool {
    static func random(probability: Double) -> Bool {
        return Double.random(in: 0...1) < probability
    }
}

#Preview {
    WordGameView()
}
