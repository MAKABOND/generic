import UIKit

// =================================
// MARK: - Hometask
// =================================

/*
 Для решения данных задач используйте Generics и Closures */

/*
 1. Реализуйте универсальную функцию для выполнения простых математических операций
 2. Реализуйте универсальную функцию, которая отсортирует массив по возрастанию или убыванию
 3. Реализуйте универсальную функцию, которая отсортированный массив из задачи 2 запакует в словарь,
    где порядковый номер элемента - это ключ, а значение массива перенесите в значение словаря. */


// =================================
// MARK: - Task 1
// =================================

func count<T: Equatable>(item1: T, item2: T, closure: (T, T) -> T) -> T {
    return closure(item1, item2)
}

var result = count(item1: 10, item2: 10, closure: {$0 * $1})
print(result)

var result1 = count(item1: 10, item2: 10, closure: {$0 / $1})
print(result1)

// =================================
// MARK: - Task 2
// =================================

enum HowToSort {
    case less
    case more
}

func sortArray<T: Comparable>(_ array: [T], with type: HowToSort = .less) -> [T] {
    switch type {
    case .less:
        return array.sorted(by: <)
    default:
        return array.sorted(by: >)
    }
}

let sortedArray = sortArray(["Makar", "Ivan", "Gucci"], with: .less)
print(sortedArray)


// =================================
// MARK: - Task 3
// =================================

func createIndex<T>(elms:[T], key:(Int) -> Int) -> [Int:T] {
    var dict = [Int:T]()
    for (index, elm) in elms.enumerated() {
        dict[key(index)] = elm
    }
    return dict
}

let dict = createIndex(elms: sortedArray) { $0 }
print(dict)


