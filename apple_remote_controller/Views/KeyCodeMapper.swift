import Foundation
import Carbon.HIToolbox

enum KeyCodeMapper {
    static func keyCode(for key: String) -> CGKeyCode? {
        switch key.uppercased() {
        case "A": return CGKeyCode(kVK_ANSI_A)
        case "B": return CGKeyCode(kVK_ANSI_B)
        case "C": return CGKeyCode(kVK_ANSI_C)
        case "D": return CGKeyCode(kVK_ANSI_D)
        case "E": return CGKeyCode(kVK_ANSI_E)
        case "F": return CGKeyCode(kVK_ANSI_F)
        case "G": return CGKeyCode(kVK_ANSI_G)
        case "H": return CGKeyCode(kVK_ANSI_H)
        case "I": return CGKeyCode(kVK_ANSI_I)
        case "J": return CGKeyCode(kVK_ANSI_J)
        case "K": return CGKeyCode(kVK_ANSI_K)
        case "L": return CGKeyCode(kVK_ANSI_L)
        case "M": return CGKeyCode(kVK_ANSI_M)
        case "N": return CGKeyCode(kVK_ANSI_N)
        case "O": return CGKeyCode(kVK_ANSI_O)
        case "P": return CGKeyCode(kVK_ANSI_P)
        case "Q": return CGKeyCode(kVK_ANSI_Q)
        case "R": return CGKeyCode(kVK_ANSI_R)
        case "S": return CGKeyCode(kVK_ANSI_S)
        case "T": return CGKeyCode(kVK_ANSI_T)
        case "U": return CGKeyCode(kVK_ANSI_U)
        case "V": return CGKeyCode(kVK_ANSI_V)
        case "W": return CGKeyCode(kVK_ANSI_W)
        case "X": return CGKeyCode(kVK_ANSI_X)
        case "Y": return CGKeyCode(kVK_ANSI_Y)
        case "Z": return CGKeyCode(kVK_ANSI_Z)

        case "0": return CGKeyCode(kVK_ANSI_0)
        case "1": return CGKeyCode(kVK_ANSI_1)
        case "2": return CGKeyCode(kVK_ANSI_2)
        case "3": return CGKeyCode(kVK_ANSI_3)
        case "4": return CGKeyCode(kVK_ANSI_4)
        case "5": return CGKeyCode(kVK_ANSI_5)
        case "6": return CGKeyCode(kVK_ANSI_6)
        case "7": return CGKeyCode(kVK_ANSI_7)
        case "8": return CGKeyCode(kVK_ANSI_8)
        case "9": return CGKeyCode(kVK_ANSI_9)

        case "SPACE": return CGKeyCode(kVK_Space)
        case "RETURN": return CGKeyCode(kVK_Return)
        case "TAB": return CGKeyCode(kVK_Tab)
        case "ESCAPE": return CGKeyCode(kVK_Escape)
        case "DELETE": return CGKeyCode(kVK_Delete)
        case "←": return CGKeyCode(kVK_LeftArrow)
        case "→": return CGKeyCode(kVK_RightArrow)
        case "↑": return CGKeyCode(kVK_UpArrow)
        case "↓": return CGKeyCode(kVK_DownArrow)

        default:
            return nil
        }
    }
}
