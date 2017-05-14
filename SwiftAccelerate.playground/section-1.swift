import Accelerate

/**
 *  Vector & Scalar
 */

var v = [1.0, 0.0]
var s = 3.0
var vsresult = [Double](repeating : 0.0, count : v.count)
vDSP_vsaddD(v, 1, &s, &vsresult, 1, vDSP_Length(v.count))
vsresult

vDSP_vsmulD(v, 1, &s, &vsresult, 1, vDSP_Length(v.count))
vsresult

vDSP_vsdivD(v, 1, &s, &vsresult, 1, vDSP_Length(v.count))
vsresult


/**
 *  Vector & Vector
 */
var v1 = [2.0, 5.0]
var v2 = [3.0, 4.0]
var vvresult = [Double](repeating : 0.0, count : 2)
vDSP_vaddD(v1, 1, v2, 1, &vvresult, 1, vDSP_Length(v1.count))
vvresult

vDSP_vmulD(v1, 1, v2, 1, &vvresult, 1, vDSP_Length(v1.count))
vvresult

vDSP_vdivD(v1, 1, v2, 1, &vvresult, 1, vDSP_Length(v1.count))
vvresult


/**
 *  Dot Product
 */
var v3 = [1.0, 2.0]
var v4 = [3.0, 4.0]
var dpresult = 0.0
vDSP_dotprD(v3, 1, v4, 1, &dpresult, vDSP_Length(v3.count))
dpresult


/**
 *  Matrix Multiplication
 */
var m1 = [ 3.0, 2.0, 4.0, 5.0, 6.0, 7.0 ]
var m2 = [ 10.0, 20.0, 30.0, 30.0, 40.0, 50.0]
var mresult = [Double](repeating : 0.0, count : 9)

vDSP_mmulD(m1, 1, m2, 1, &mresult, 1, 3, 3, 2)
mresult


/**
 *  Matrix Inversion
 */
func invert(matrix : [Double]) -> [Double] {
    var inMatrix = matrix
    var N = __CLPK_integer(sqrt(Double(matrix.count)))
    var pivots = [__CLPK_integer](repeating: 0, count: Int(N))
    var workspace = [Double](repeating: 0.0, count: Int(N))
    var error : __CLPK_integer = 0
    dgetrf_(&N, &N, &inMatrix, &N, &pivots, &error)
    dgetri_(&N, &inMatrix, &N, &pivots, &workspace, &N, &error)
    return inMatrix
}

var m = [1.0, 2.0, 3.0, 4.0]
invert(matrix: m)


/**
 *  Matrix Transpose
 */

var t = [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
var mtresult = [Double](repeating : 0.0, count : t.count)
vDSP_mtransD(t, 1, &mtresult, 1, 3, 2)
mtresult
