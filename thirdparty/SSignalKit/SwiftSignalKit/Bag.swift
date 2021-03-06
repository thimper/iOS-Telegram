import Foundation

public final class Bag<T> {
    public typealias Index = Int
    fileprivate var nextIndex: Index = 0
    fileprivate var items: [T] = []
    fileprivate var itemKeys: [Index] = []
    
    public init() {
    }
    
    public func add(_ item: T) -> Index {
        let key = self.nextIndex
        self.nextIndex += 1
        self.items.append(item)
        self.itemKeys.append(key)
        
        return key
    }
    
    public func get(_ index: Index) -> T? {
        var i = 0
        for key in self.itemKeys {
            if key == index {
                return self.items[i]
            }
            i += 1
        }
        return nil
    }
    
    public func remove(_ index: Index) {
        var i = 0
        for key in self.itemKeys {
            if key == index {
                self.items.remove(at: i)
                self.itemKeys.remove(at: i)
                break
            }
            i += 1
        }
    }
    
    public func removeAll() {
        self.items.removeAll()
        self.itemKeys.removeAll()
    }
    
    public func copyItems() -> [T] {
        return self.items
    }
    
    public func copyItemsWithIndices() -> [(Index, T)] {
        var result: [(Index, T)] = []
        var i = 0
        for key in self.itemKeys {
            result.append((key, self.items[i]))
            i += 1
        }
        return result
    }
    
    public var isEmpty: Bool {
        return self.items.isEmpty
    }
    
    public var first: (Index, T)? {
        if !self.items.isEmpty {
            return (self.itemKeys[0], self.items[0])
        } else {
            return nil
        }
    }
}
