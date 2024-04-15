
import UIKit

class FurnitureDetailViewController: UIViewController ,UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    var furniture: Furniture?
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var choosePhotoButton: UIButton!
    @IBOutlet var furnitureTitleLabel: UILabel!
    @IBOutlet var furnitureDescriptionLabel: UILabel!
    
    init?(coder: NSCoder, furniture: Furniture?) {
        self.furniture = furniture
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateView()
    }
    
    func updateView() {
        guard let furniture = furniture else {return}
        if let imageData = furniture.imageData,
            let image = UIImage(data: imageData) {
            photoImageView.image = image
        } else {
            photoImageView.image = nil
        }
        
        furnitureTitleLabel.text = furniture.name
        furnitureDescriptionLabel.text = furniture.description
    }
    
    @IBAction func choosePhotoButtonTapped(_ sender: Any) {
//        print("choose photo")
        let alertController = UIAlertController(title: nil, message: "Select Photo", preferredStyle: .actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel text", style: .cancel, handler: nil)
//        let cameraAction = UIAlertAction(title: "Image from Camera", style: .default, handler: nil)
//        let galleryAction = UIAlertAction(title: "Image from Gallery", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            let cameraAction = UIAlertAction(title: "Image from Camera", style: .default, handler: {(_) in
                imagePicker.sourceType = .camera
                self.present(imagePicker, animated: true, completion: nil)
                
                
                
                
                
            })

            alertController.addAction(cameraAction)
        }
        
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let galleryAction = UIAlertAction(title: "Image from Gallery", style: .default, handler: { (_) in
                imagePicker.sourceType = .photoLibrary
                self.present(imagePicker, animated: true, completion: nil)
                
            })
            
            
            
            alertController.addAction(galleryAction)
        }
        
        
        
       
        present(alertController,animated: true, completion: nil)
        
        
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true,completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else{
            return
            
        }
        furniture?.imageData = image.pngData()
        dismiss(animated: true){
            self.updateView()
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String: Any]) {
        print("picked")
    }

    @IBAction func actionButtonTapped(_ sender: Any) {
//        print("photo tapped")
        
        guard let furniture = furniture else {
            return
        }
        var items: [Any] = ["\(furniture.name):\(furniture.description)"]
        if let image = choosePhotoButton.backgroundImage(for: .normal){
            items.append(image)
        }
        let activity = UIActivityViewController(activityItems: items, applicationActivities: nil)
        present(activity, animated: true, completion: nil)
        
    }
    
}
