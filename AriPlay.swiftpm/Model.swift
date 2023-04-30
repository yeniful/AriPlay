import AVFoundation

enum ARRInstrument: String {
    case gayageum = "Gayageum"
    case haegeum = "Haegeum"
    case taepyeongso = "Taepyeongso"
    case tungso = "Tungso"
}

enum ARRNote: String {
    case a = "1"
    case b = "2"
    case c = "3"
    case d = "4"
    case e = "5"
    case f = "6"
}

let description: [String: String] =
[
    "Gayageum": "The gayageum is a stringed instrument that represents Korea. The Gayageum was created in the 6th century by King Gassil of Gaya, modeled after a Tang Dynasty instrument. It consists of 12 strings made of silk thread. It has a clear, elegant tone and can be played in a variety of ways.",
    
    "Haegeum" : "The Haegeum is a stringed instrument introduced to Korea during the Goryeo Dynasty. It was used in court music and later became widely used in folk music performances.",
    
    "Taepyeongso" : "The taepyungso is a woodwind instrument. It is also called a Nalari. It has eight holes, two of which are on the back of the instrument.",
    
    "Tungso" : "The Tungso is a wind instrument made of bamboo. Unlike wind instruments that are closed at one end, it has holes on both sides. Tungso originated as a wind instrument in China, and in Korea, the instrument was shortened in length."
]

func getDesctription(instrument: ARRInstrument) -> String {
    return description[instrument.rawValue] ?? "error"
}
