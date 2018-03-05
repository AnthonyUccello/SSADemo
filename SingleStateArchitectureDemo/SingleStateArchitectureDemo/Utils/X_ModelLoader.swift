import Foundation

class X_ModelLoader
{
    static func LoadModels() -> ()
    {
        if let path = Bundle.main.path(forResource: "ShoeDatabase", ofType: "txt")
        {
            let fm = FileManager()
            let exists = fm.fileExists(atPath: path)
            if (exists)
            {
                let content = fm.contents(atPath: path)
                let contentAsString = String(data: content!, encoding: String.Encoding.utf8)
            }
        }
    }
}
