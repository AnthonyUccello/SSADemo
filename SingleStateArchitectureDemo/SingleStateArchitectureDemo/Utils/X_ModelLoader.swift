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
                let data:Data! = fm.contents(atPath: path)!
                let contentAsString = String(data: data, encoding: String.Encoding.utf8)
                if let json = try? JSONSerialization.jsonObject(with: data, options: [])
                {
                    let models = (json as? [String:Any])!
                    let shoeModels = models["ShoeModels"] as? [[String:Any]]
                    
                    for modelDict:[String:Any] in shoeModels!
                    {
                        if let modelData = try?  JSONSerialization.data(withJSONObject: modelDict, options: .prettyPrinted)
                        {
                            do
                            {
                                let model = try JSONDecoder().decode(M_Shoe.self, from: modelData)
                                MM_TypeToShoe.SetModel(type: model.type, model: model)
                            }
                            catch let error
                            {
                                print("Error: \(error)")
                            }
                        }
                    }
                }

            }
            
            print(MM_TypeToShoe.GetAll())
        }
    }
}
