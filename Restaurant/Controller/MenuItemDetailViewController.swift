//
//  MenuItemDetailViewController.swift
//  Restaurant
//
//  Created by Rohit Jangid on 04/03/21.
//

import UIKit

class MenuItemDetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView! {
        didSet {
            imageView.layer.cornerRadius = 10
            imageView.clipsToBounds = true
        }
    }
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    var menuItem: MenuItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        addToOrderButton.layer.cornerRadius = 2.0
        updateUI()
    }
    
    func updateUI() {
        guard let menuItem = menuItem else { return }
        
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        detailTextLabel.text = menuItem.detailText
        MenuController.shared.fetchImage(url: menuItem.imageURL) { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    
    @IBAction func addToOrderButtonTapped(_ sender: UIButton) {
        guard let menuItem = menuItem else { return }
        
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.59 , y: 1.5)
            self.addToOrderButton.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        MenuController.shared.order.menuItems.append(menuItem)
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        guard let menuItem = menuItem else { return }
        
        coder.encode(menuItem.id, forKey: "menuItemId")
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        let menuItemID = Int(coder.decodeInt32(forKey: "menuItemId"))
        menuItem = MenuController.shared.item(withID: menuItemID)!
        updateUI()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
