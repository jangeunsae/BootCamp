import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var CalLabel: UILabel!

    var input = "" {
        didSet {
            CalLabel.text = input.isEmpty ? "0" : input
        }
    }

    @IBAction func Tapbutton(_ sender: UIButton) {
        let tag = sender.tag

        switch tag {
        case 0...9:
            // 첫 자리에 0 금지
            if input.isEmpty && tag == 0 {
                return
            }
            input += "\(tag)"

        case 100: // AC 버튼
            input = ""

        case 101: // +
            addOperator("+")
            
        case 102: // -
            addOperator("-")

        case 103: // *
            addOperator("*")

        case 104: // /
            addOperator("/")

        case 105: // =
            calculateResult()

        default:
            break
        }
    }

    // 연산자 입력 처리 함수
    func addOperator(_ op: String) {
        // 입력이 비어 있거나 마지막이 연산자면 금지
        if input.isEmpty || isLastCharacterOperator() {
            return
        }
        input += op
    }

    // 마지막 문자가 연산자인지 확인
    func isLastCharacterOperator() -> Bool {
        guard let last = input.last else { return false }
        return "+-*/".contains(last)
    }

    // 입력된 수식을 계산하는 함수
    func calculateResult() {
        // 잘못된 입력 방지: 맨 끝이 연산자면 계산 X
        if input.isEmpty || isLastCharacterOperator() {
            return
        }

        // NSExpression을 이용한 계산
        let expression = NSExpression(format: input)
        if let result = expression.expressionValue(with: nil, context: nil) as? NSNumber {
            input = "\(result)"
        } else {
            input = "오류"
        }
    }
}
