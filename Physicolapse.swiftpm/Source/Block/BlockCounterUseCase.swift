//
//  BlockCounterUseCase.swift
//  Physicollapse
//
//  Created by zaehorang on 2/17/25.
//

import Foundation

protocol BlockCounterUseCase {
    var blockCount: Int { get }
    
    func getBlockCount() -> Int
    func increseBlockCount()
    func decreseBlockCount()
    func resetBlockCount()
}

final class BlockCounterUseCaseImpl: ObservableObject, BlockCounterUseCase {
    @Published private(set) var blockCount: Int = 0
    
    func getBlockCount() -> Int { self.blockCount }
    
    func increseBlockCount() { blockCount += 1 }
    
    func decreseBlockCount() {
        blockCount = max(0, blockCount - 1) // 0 이하로 감소 방지
    }
    
    func resetBlockCount() { blockCount = 0 }
}
