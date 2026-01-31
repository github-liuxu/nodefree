//
//  main.swift
//  nodefree
//
//  Created by 刘东旭 on 1/31/26.
//

import Foundation

func fetchData() {
    let help = Help(type: 1)
    // 1. 定义 URL
    guard let url = URL(string: help.ClashUrlString()) else { return }
    
    // 2. 创建任务
    let task = URLSession.shared.dataTask(with: url) { data, response, error in
        // 处理错误
        if let error = error {
            print("请求失败: \(error.localizedDescription)")
            return
        }
        
        // 检查状态码
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 {
            if let data = data {
                // 3. 解析数据 (JSON)
                let content = String(data: data, encoding: .utf8)
                print("返回内容: \(content ?? "")")
                let clashfile = help.ClashDir()
                do {
                    try content?.write(toFile: clashfile, atomically: true, encoding: .utf8)
                } catch let e {
                    print(e)
                }
            }
        }
    }
    
    // 4. 启动任务
    task.resume()
}

fetchData()
RunLoop.current.run()
