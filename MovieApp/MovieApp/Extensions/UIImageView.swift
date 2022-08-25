//
//  UIImageView.swift
//  MovieApp
//
//  Created by gokalp.koksal on 12.08.2022.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with url: URL) -> ImageTask? {
        self.kf.cancelDownloadTask()
        
        let task = self.kf.setImage(with: url)
        // Optional<DownloadTask>
        return task.map { ImageTask(task: $0) }
    }
}

struct ImageTask {
    private let task: DownloadTask
    
    init(task: DownloadTask) {
        self.task = task
    }
    
    func cancel() {
        task.cancel()
    }
}
