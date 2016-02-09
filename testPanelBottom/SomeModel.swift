//
//  SomeModel.swift
//  testPanelBottom
//
//  Created by asdfgh1 on 09/02/16.
//  Copyright © 2016 rshev. All rights reserved.
//

import UIKit

class SomeModel {
    
//    weak var delegate: SomeModelDataSource?
    
    func getImages() -> [UIImage?] {
        return [
            UIImage(named: "dog1"),
            UIImage(named: "dog2"),
            UIImage(named: "dog3"),
            UIImage(named: "dog4"),
        ]
    }
    
    func getName() -> String {
        return "Handsome guy, 32"
    }
    
    func getTextSummary() -> String {
        return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla mollis, nulla in varius ornare, nisl."
    }
    
    func getTextLong() -> String {
        return "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur malesuada ornare dui id convallis. Nam porttitor orci purus, eget cursus nisl consectetur pharetra. Pellentesque faucibus sagittis arcu id iaculis. Vestibulum sed convallis est, eget pretium mi. Ut quis pellentesque sapien. Nullam ac tortor eget dui blandit dignissim. In a dui fringilla, auctor mauris nec, tempor nisi. Maecenas vel tristique ante.\n\nQuisque condimentum interdum nulla ac rutrum. Integer sit amet mollis massa. Integer sed ornare magna. Vestibulum ipsum urna, tempor in ullamcorper eu, gravida sed mi. Curabitur tempus mauris neque, et interdum orci ornare eu. Cras sit amet consequat ante, a tincidunt turpis. Suspendisse lacinia, enim quis cursus egestas, dolor lacus porta libero, ac ultricies mauris sapien eget justo. In nec sagittis ligula, et fermentum ligula. Quisque feugiat non lectus cursus aliquam. Suspendisse lacinia feugiat nisl, vitae ullamcorper orci suscipit sit amet. Suspendisse id tempor sapien. Vestibulum volutpat ante nec venenatis lacinia. Morbi sed finibus massa. Maecenas sed lectus sodales, maximus odio nec, placerat arcu. Mauris at aliquam orci.\n\nPhasellus vel justo ex. Duis blandit, orci non cursus ullamcorper, arcu diam scelerisque tortor, ac consequat mauris erat ut magna. Aenean vel dui condimentum, ullamcorper massa in, rutrum mi. Morbi ut blandit massa. Etiam tempor ultrices mi, id fringilla tellus tincidunt nec. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Integer justo eros, facilisis nec gravida eu, tincidunt sit amet ex. Etiam mollis, nibh quis suscipit posuere, dolor nunc aliquam nulla, mollis scelerisque lectus ex id leo.\n\nCurabitur suscipit libero posuere orci blandit dapibus. Sed varius turpis in odio congue laoreet. Maecenas efficitur ex ut nunc tempor finibus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Suspendisse ornare ipsum non imperdiet placerat. Nunc et justo sed ex vestibulum rhoncus eget quis massa. Quisque ultrices magna non enim fermentum fermentum ac in velit.\n\nInterdum et malesuada fames ac ante ipsum primis in faucibus. Ut condimentum ac mauris quis interdum. Nullam ut metus et ex ultrices egestas. Donec in libero orci. Sed interdum lobortis nunc. Ut quis imperdiet lectus. Proin ipsum diam, bibendum id maximus ac, accumsan at ex. Curabitur vel nisi turpis. Vestibulum non hendrerit orci, ut fermentum est. Proin malesuada, metus ac ultrices aliquam, nunc est iaculis enim, sit amet maximus mauris tortor id leo. Etiam pellentesque scelerisque lorem, ac fermentum nunc cursus eget. Vivamus libero magna, mattis vitae faucibus vitae, tempus at erat."
    }
    
}
