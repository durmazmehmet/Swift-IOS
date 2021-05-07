//: Playground - noun: a place where people can play

import Cocoa

//CLOSURE

//A. fonksiyon içine fonksiyon olarak parametre yollamak

func hesapla (n1: Int, n2: Int, operasyon: (Int, Int) -> Int) -> Int {
    return operasyon(n1, n2)
}

//Şimdi iki tane fonksiyon yazalım
func carp (no1: Int, no2: Int) -> Int {
    return no1 * no2
}

func topla (no1: Int, no2: Int) -> Int {
    return no1 + no2
}

//hesapla hesapla fonksiyonunu 2 işlem için çağırıyoruz

hesapla (n1: 2, n2: 3, operasyon: carp)     // sonuc: 6

hesapla (n1: 2, n2: 3, operasyon: topla)     // sonuc: 5

// hesapla müteahhit gibin işi aldı biz ona ne imalat istediysek ilgili altyükleniciye işi taşere etti.


//B. closure tarzı ile yukarıdaki nasıl olurdu

// B1 bu taşeron fonksiyonu closure yapalım:

//carp fonksiyonun anatomisi
//keyword——isim———input———————-output
//func             carp         (no1: Int, no2: Int) -> Int
//{
//    return no1 * no2
//}

//Keyword ve isimi kaldıralım ve başlangıç anti parantezini başa alalım
//Output yanına “in” kelimesini koyalım
//Ve closure oluştu

//{ (no1: Int, no2: Int) -> Int in
//    return no1 * no2 }

//B2. şimdi ana fonksiyonu içinde closure ile çağırmayı deneyelim

//içinde closure olan fonksiyon çağırma
hesapla (n1: 2, n2: 3, operasyon: { (no1: Int, no2: Int) -> Int in
    return no1 * no2
})

//B3. şimdi çağırırken  dahada kısa tutabiliriz

//şu mantıkla
// var a : Int = 2 dersek a tamsayı ve 2 değerinde
// var a = 2 dersek a’yı verdiğimiz tamsayı değerinden dolayı Int yapar derleyici

//Adım adım dönüşüm ile

//0. orjinali

hesapla (n1: 2, n2: 3, operasyon: { (no1: Int, no2: Int) -> Int in
    return no1 * no2
})

//1. closure’un input kısmında type deklarasyonlarını kaldır

hesapla (n1: 2, n2: 3, operasyon: { (no1, no2) -> Int in
    return no1 * no2
})

//2. closure’un output kısmında type deklarasyonlarını kaldır

hesapla (n1: 2, n2: 3, operasyon: { (no1, no2) in
    return no1 * no2
})

//3. return kısmını da kaldıralım, derleyici zaten dönüş yapacağını anlıyor

hesapla (n1: 2, n2: 3, operasyon: { (no1, no2) in
    no1 * no2
})

//4. bari tek satır olsun

hesapla (n1: 2, n2: 3, operasyon: { (no1, no2) in no1 * no2 })

//5. Parametre temsilinde $0 (ilk param), $1 (2. Param), $2(3. Param), ….. diye parametre
//atamasını yapıp doğrudan bir değişkene/sabite aratabiliriz

let sonuc = hesapla (n1: 2, n2: 3, operasyon: {$0 * $1})

print(sonuc)

//6. Duramıyoruz sayın seyirciler trailing closure varmış

let sonucOha = hesapla (n1: 2, n2: 3) {$0 * $1}

print(sonuc)

//SONUÇ

func sonucolarak_hesapla (n1: Int, n2: Int, operasyon: (Int, Int) -> Int) -> Int {
    return operasyon(n1, n2)
}

//AŞAĞIDAKİ SATIRLAR YERİNE

func uzunhali_carp (no1: Int, no2: Int) -> Int {
    return no1 * no2
}

sonucolarak_hesapla (n1: 2, n2: 3, operasyon: carp)

//BÖYLE YAZILABİLİR

let SonucOlaraksonucOha = sonucolarak_hesapla (n1: 2, n2: 3) {$0 * $1}
print(SonucOlaraksonucOha)
