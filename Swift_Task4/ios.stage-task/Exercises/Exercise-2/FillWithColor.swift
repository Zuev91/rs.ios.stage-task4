import Foundation

final class FillWithColor {
    
    fileprivate func validate(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> Bool {
        
        if image.isEmpty {
            return false
        }
        
        if image[0].isEmpty {
            return false
        }
        
        if !(0...image.count).contains(row) {
            return false
        }
        
        if !(0...image[0].count).contains(column) {
            return false
        }
        
        for value in image {
            for tmp in value {
                if tmp < 0 {
                    return false
                }
            }
        }
        
        if newColor > 65536 {
            return false
        }
        
        return true
    }
    
    static func neighbours(_ row:Int, _ column:Int, _ rowsCount:Int, _ columnsCount:Int) -> [(Int,Int)] {
            var result:[(Int, Int)] = []
            for (i,j) in [(row, column - 1), (row, column + 1), (row - 1, column), (row + 1, column)] {
                    if (i >= 0  && j >= 0 && i < rowsCount && j < columnsCount) {
                        result.append((i, j))
                    }
            }
            return result
        }
    
    func fillWithColor(_ image: [[Int]], _ row: Int, _ column: Int, _ newColor: Int) -> [[Int]] {
        if !validate(image, row, column, newColor) {
            return image
            }
        let rowsCount = image.count
        let columnsCount = image[0].count
        var isVisited: [[Bool]] = [[]]
        var mutableImage = image
        let oldColor = image[row][column]

        isVisited = Array(repeating: Array(repeating: false, count: columnsCount), count: rowsCount)
        isVisited[row][column] = true
        var peaks = [(row, column)]
        mutableImage[row][column] = newColor
        while peaks.count > 0 {
        let (row, column) = peaks[peaks.count - 1]
        peaks.remove(at:peaks.count - 1)
        let neighbours = FillWithColor.neighbours(row, column, rowsCount, columnsCount)
        for (i,j) in neighbours {
            if !isVisited[i][j] && image[i][j] == oldColor {
                isVisited[i][j] = true
                mutableImage[i][j] = newColor
                peaks.append((i,j))
                }
            }
        }
                return mutableImage
    }
}

//An image is represented by an `m = row x n = column` integer grid image where `image[i][j]` represents the pixel value of the image.
//
//In turn, three integers are given (`row, column, newColor`). It is necessary to fill the image with color starting from the pixel image - `image[row][column]`.


//**`m == image.length`**
//**`n == image[i].length`**
//**`1 <= m, n <= 50`**
//**`0 <= image[i][j], newColor < 65536`**
//**`0 <= row <= m`**
//**`0 <= column <= n`**

