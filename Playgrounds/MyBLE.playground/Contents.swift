import UIKit

var str = "Hello, playground"

let managerDelegate: PlaygroundBluetoothCentralManagerDelegate = <# manager delegate instance #>

let manager = PlaygroundBluetoothCentralManager(services: nil)
manager.delegate = managerDelegate

let viewDelegate: PlaygroundBluetoothConnectionViewDelegate = <# view delegate instance #>
let connectionView = PlaygroundBluetoothConnectionView(centralManager: manager, delegate: viewDelegate)
connectionView.dataSource = viewDelegate

// Place the connection view within the rest of your page's content.
let page: UIViewController & PlaygroundLiveViewSafeAreaContainer = <# playground page view controller #>
page.view.addSubview(connectionView)

// Position the connection view in the top right corner.
connectionView.topAnchor.constraint(equalTo: page.liveViewSafeAreaGuide.topAnchor, constant: 20).isActive = true
connectionView.trailingAnchor.constraint(equalTo: page.liveViewSafeAreaGuide.trailingAnchor, constant: -20).isActive = true

PlaygroundPage.current.liveView = page
