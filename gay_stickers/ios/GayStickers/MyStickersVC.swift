import UIKit
import Messages

class MyStickersVC: MSStickerBrowserViewController {

    //create stickers array
    var stickers = [MSSticker]()

    //load assets into stickers array
    func loadStickers() {
        var type = 0
        
        if let userDefaults = UserDefaults(suiteName: "group.dundukov") {
            if (userDefaults.value(forKey: "stick_type") != nil) {
                type = userDefaults.integer(forKey: "stick_type")
            }
        }
        if (type == 0) {
            createSticker(asset: "1_a", localizedDescription: "1")
            createSticker(asset: "1_b", localizedDescription: "2")
            createSticker(asset: "1_c", localizedDescription: "3")
            createSticker(asset: "1_d", localizedDescription: "4")
            createSticker(asset: "1_e", localizedDescription: "5")
            createSticker(asset: "1_f", localizedDescription: "6")
            createSticker(asset: "1_g", localizedDescription: "7")
            createSticker(asset: "1_h", localizedDescription: "8")
        } else if (type == 1) {
            createSticker(asset: "2_a", localizedDescription: "1")
            createSticker(asset: "2_b", localizedDescription: "2")
            createSticker(asset: "2_c", localizedDescription: "3")
            createSticker(asset: "2_d", localizedDescription: "4")
            createSticker(asset: "2_e", localizedDescription: "5")
            createSticker(asset: "2_f", localizedDescription: "6")
            createSticker(asset: "2_g", localizedDescription: "7")
            createSticker(asset: "2_h", localizedDescription: "8")
        }else if (type == 2) {
            createSticker(asset: "3_a", localizedDescription: "1")
            createSticker(asset: "3_b", localizedDescription: "2")
            createSticker(asset: "3_c", localizedDescription: "3")
            createSticker(asset: "3_d", localizedDescription: "4")
            createSticker(asset: "3_e", localizedDescription: "5")
            createSticker(asset: "3_f", localizedDescription: "6")
            createSticker(asset: "3_g", localizedDescription: "7")
            createSticker(asset: "3_h", localizedDescription: "8")
        }
    }

    //func to create sticker
    func createSticker(asset: String, localizedDescription: String) {

        //create url from assets in main bundle
        guard let stickerPath = Bundle.main.path(forResource: asset, ofType: "png") else {
            print("Couldn't create sticker path for", asset)
            return
        }
        let stickerURL = URL(fileURLWithPath: stickerPath)
        let sticker: MSSticker

        //create sticker from path(and localized description) and add to array
        do {
            try sticker = MSSticker(contentsOfFileURL: stickerURL,
                                 localizedDescription: localizedDescription)
            stickers.append(sticker)
        } catch {
            print(error)
            return
        }
    }

    //datasource methods
    override func numberOfStickers(in stickerBrowserView: MSStickerBrowserView) -> Int {
        return stickers.count
    }
    override func stickerBrowserView(_ stickerBrowserView: MSStickerBrowserView,
                                          stickerAt index: Int) -> MSSticker {
        return stickers[index]
    }
}
