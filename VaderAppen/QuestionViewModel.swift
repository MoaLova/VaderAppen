//
//  QuestionViewModel.swift
//  VaderAppen
//
//  Created by Moa.Svensson on 2024-03-08.
//

import Foundation


class QuestionsViewModel: ObservableObject {
    var questions = [
            Question(question: "What is the average temperature on Earth?", correctAnswer: "15 degrees Celsius",
                     incorrectAnswers: ["0 degrees Celsius", "10 degrees Celsius", "20 degrees Celsius"]),
            
            Question(question: "Which atmospheric component is most responsible for the greenhouse effect?", correctAnswer: "Water vapor",
                     incorrectAnswers: ["Nitrogen", "Oxygen", "Carbon dioxide"]),
            
            Question(question: "What is the highest documented temperature on Earth?", correctAnswer: "50 degrees Celsius",
                     incorrectAnswers: ["75 degrees Celsius", "60 degrees Celsius", "85 degrees Celsius"]),
            
            Question(question: "What is a powerful vortex over water that can be associated with severe storms called?", correctAnswer: "Hurricane",
                     incorrectAnswers: ["Waterspout", "Tornado", "Typhoon"]),
            
            Question(question: "What is the term for the measurement of air pressure?", correctAnswer: "Millibar",
                     incorrectAnswers: ["Celsius", "Hectometer", "Fahrenheit"]),
            
            Question(question: "In which unit is wind commonly measured?", correctAnswer: "Kilometers per hour (km/h)",
                     incorrectAnswers: ["Meters per second (m/s)", "Kilometers per second (km/s)", "Kilometers per minute (km/min)"]),
            
            Question(question: "What is the primary source of energy that drives Earth's weather?", correctAnswer: "The Sun",
                     incorrectAnswers: ["The Moon", "Volcanoes", "Earth's core"]),
            
            Question(question: "Which unit is used to measure humidity in the air?", correctAnswer: "Percent (%)",
                     incorrectAnswers: ["Hertz (Hz)", "Celsius (°C)", "Millimeters of mercury (mmHg)"]),
            
            Question(question: "What type of cloud is known for producing rain?", correctAnswer: "Nimbostratus",
                     incorrectAnswers: ["Cirrus", "Cumulus", "Stratus"]),
            
            Question(question: "What is the process called where water returns from liquid form to gas form?", correctAnswer: "Evaporation",
                     incorrectAnswers: ["Condensation", "Melting", "Sublimation"]),
            
            Question(question: "What term is used for the air temperature at which water vapor condenses into water droplets?", correctAnswer: "Dew point",
                     incorrectAnswers: ["Freezing point", "Condensation point", "Melting temperature"]),
            
            Question(question: "What is a 'monsoon'?", correctAnswer: "A seasonally related wind that brings rain",
                     incorrectAnswers: ["A snowstorm", "A thunderstorm", "A strong wind"]),
            
            Question(question: "What is the term for the thermal warming of Earth's atmosphere caused by increasing levels of greenhouse gases?", correctAnswer: "Global warming",
                     incorrectAnswers: ["Global cooling", "Ozone depletion", "Earth's rotation"]),
            
            Question(question: "Which meteorological event causes wind, rain, and snow as well as thunderstorms and tornadoes?", correctAnswer: "Front",
                     incorrectAnswers: ["High-pressure system", "Low-pressure system", "Jet stream"]),
            
            Question(question: "Which unit is used to measure the amount of precipitation?", correctAnswer: "Millimeters (mm)",
                     incorrectAnswers: ["Celsius (°C)", "Kilometers per hour (km/h)", "Hectometer (hm)"]),
            
            Question(question: "What type of cloud is thin and wispy and can indicate fair weather or that rain is on the way?", correctAnswer: "Cirrus",
                     incorrectAnswers: ["Cumulus", "Stratus", "Nimbostratus"]),
            
            Question(question: "What is the process called where water droplets collide with each other to form larger droplets that then fall as precipitation?", correctAnswer: "Aggregation",
                     incorrectAnswers: ["Evaporation", "Condensation", "Sublimation"]),
            
            Question(question: "What term is used for a sudden and brief drop in temperature during the night, typically in a dry climate?", correctAnswer: "Frost",
                     incorrectAnswers: ["Heatwave", "Cooling", "Drought"]),
            
            Question(question: "Which of the following is a term describing an area of extremely low air pressure and strong winds?", correctAnswer: "Cyclone",
                     incorrectAnswers: ["Anticyclone", "Hurricane", "Tornado"]),
            
            Question(question: "What term is used for a meteorological event where warm and humid air mass collides with a cold air mass, which can result in heavy rain showers and thunderstorms?", correctAnswer: "Front",
                     incorrectAnswers: ["Dormancy", "Isostasy", "Monsoon"]),
            
            Question(question: "Which type of cloud is known for covering the sky in a gray layer and often causing prolonged rain and foggy weather?", correctAnswer: "Stratus",
                     incorrectAnswers: ["Cumulus", "Cirrus", "Nimbostratus"]),
            
            Question(question: "What is a thermal updraft created when warm, moist air rises and cools, resulting in the condensation of water vapor?", correctAnswer: "Convection",
                     incorrectAnswers: ["Advection", "Convergence", "Divergence"]),
            
            Question(question: "What term is used for the average atmospheric conditions for temperature, air pressure, humidity, and wind over an extended period?", correctAnswer: "Climate",
                     incorrectAnswers: ["Weather", "Air pressure", "Wind conditions"]),
            
            Question(question: "What is the term for the part of Earth's atmosphere where weather occurs?", correctAnswer: "Troposphere",
                     incorrectAnswers: ["Stratosphere", "Mesosphere", "Thermosphere"]),
            
            Question(question: "Which term is used for the measurable part of precipitation that falls to the ground, such as rain, snow, and hail?", correctAnswer: "Precipitation",
                     incorrectAnswers: ["Thunder", "Drizzle", "Fallout"]),
            
            Question(question: "What meteorological event involves a sudden and brief increase in air pressure and typically results in clear and sunny weather?", correctAnswer: "High-pressure system",
                     incorrectAnswers: ["Front", "Thunderstorm", "Low-pressure system"]),
            
            Question(question: "What is the term for humidity expressed as a percentage of the maximum amount of moisture the air can hold at a given temperature?", correctAnswer: "Relative humidity",
                     incorrectAnswers: ["Absolute humidity", "Specific humidity", "Condensed humidity"]),
            
            Question(question: "Which type of cloud is known for being low and covering the sky in a gray layer, often causing mist and light precipitation?", correctAnswer: "Stratus",
                     incorrectAnswers: ["Cumulus", "Cirrus", "Altostratus"]),
            
            Question(question: "What term is used for a sudden and significant increase in air pressure, typically resulting in windy and rainy weather?", correctAnswer: "Front",
                     incorrectAnswers: ["Thunderstorm", "Low-pressure system", "High-pressure system"]),
            
            Question(question: "What is the term for the atmospheric phenomenon where light rays are bent or reflected by water droplets, creating a colorful arc?", correctAnswer: "Rainbow",
                     incorrectAnswers: ["Aurora borealis", "Halo", "Snowbow"]),
            
            Question(question: "What is the term for the process where water vapor condenses directly into ice without passing through the liquid phase?", correctAnswer: "Sublimation",
                     incorrectAnswers: ["Aggregation", "Condensation", "Evaporation"]),
            
            Question(question: "What term is used for a weather forecast covering a period of several days to a week?", correctAnswer: "Long-term forecast",
                     incorrectAnswers: ["Short-term forecast", "Medium-range forecast", "Instant forecast"]),
            
            Question(question: "Which term is used for a small, rapidly rotating vortex of air that is visible at the ground and consists of dust or debris?", correctAnswer: "Dust devil",
                     incorrectAnswers: ["Tornado", "Whirlwind", "Vortex"]),
            
            Question(question: "What is the term for a period of extremely hot weather lasting several days or longer?", correctAnswer: "Heatwave",
                     incorrectAnswers: ["Heat spell", "Sunstroke", "Heat outbreak"])
        ]
    @Published var currentQuestionIndex: Int = 0

    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }

    func nextQuestion() {
        currentQuestionIndex += 1
        if currentQuestionIndex >= questions.count {
            currentQuestionIndex = 0 // Wrap around to the first question when reaching the end
        }
    }
}
