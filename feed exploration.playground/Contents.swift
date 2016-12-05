//: Playground - noun: a place where people can play

import UIKit

class VerticalLayout: UIView {
    var yOffsets: [CGFloat] = []
    
    init(width: CGFloat) {
        super.init(frame: CGRectMake(0,0, width, 0))
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        
        var height: CGFloat = 0
        
        for i in 0..<subviews.count {
            var view = subviews[i] as UIView
            view.layoutSubviews()
            height += yOffsets[i]
            view.frame.origin.y = height
            height += view.frame.height
        }
        
        self.frame.size.height = height
        
    }
    
    override func addSubview(view: UIView) {
        yOffsets.append(view.frame.origin.y)
        super.addSubview(view)
    }
    
    func removeAll() {
        
        for view in subviews {
            view.removeFromSuperview()
        }
        
        yOffsets.removeAll(keepCapacity: false)
    }
    
}



var str = "Hello, playground"

struct Message {
    var elapsetime: Double
    var distance: Double
    var messageID: Int

}


var MessageList = [Message] ()

var TimeBarrier: Double


func MakeMessage(elapsetime: Double, _ distance: Double, _ messageID: Int) -> Message {
    var TempMessage = Message (elapsetime: 0.0, distance: 0.0, messageID: 0)
    TempMessage.elapsetime = elapsetime
    TempMessage.distance = distance
    TempMessage.messageID = messageID
        
    return TempMessage
}

func MakeMessage2(elapsetime: Double, _ distance: Double, _ messageID: Int) -> Message {
    var TempMessage = Message (opacity: 0.0, height: 0.0, messageID: 0)
    TempMessage.opacity = elapsetime
    TempMessage.distance = distance
    TempMessage.messageID = messageID
    
    return TempMessage
}

var A = MakeMessage(45.5, 1.2, 51)

var B = MakeMessage(89.1, 20.4, 5)

var C = MakeMessage(103.5, 0.4, 42)




MessageList.append(A)
MessageList.append(B)

MessageList.sort


var OpacityBarrier = 100.0

func MakeListView () -> Array <Message> {
var ListViewMessages = [Message] ()
for index in 0 ..< MessageList.count {
   if MessageList[index].elapsetime < OpacityBarrier {
        ListViewMessages.append(MessageList[index])
    }
    
    }
     return ListViewMessages
}

var ListViewMessages = [Message] ()
var StackedViewMessages = [Message] ()



func DivideMessages () {
    for index in 0 ..< MessageList.count {
        if MessageList[index].elapsetime < OpacityBarrier {
            ListViewMessages.append(MessageList[index])
        }
        else {
            StackedViewMessages.append(MessageList[index])
        }
        
    }
}




func ConvertOpacitySize () {
    for index in 0 ..< MessageList.count {
        if MessageList[index].distance < 5.0 {
        var height = (MessageList[index].distance * 25) + 145
        MessageList[index].distance = height
        }
        else {
        MessageList[index].distance = 30
        }
    }
    for index in 0 ..< MessageList.count {
            if MessageList[index].elapsetime < 720 {
                var opacity = MessageList[index].elapsetime * -0.00125 + 1
                MessageList[index].elapsetime = opacity
            }
            else {
                MessageList[index].elapsetime = 10
            }
        }
        
    }

// change above to MessageList




func ArrangeListDistance () -> Array <UIView> {
    ListViewMessages.sort({ $1.distance > $0.distance})
    var listviews = [UIView] (count: ListViewMessages.count, repeatedValue: UIView())
    for index in 0 ..< ListViewMessages.count {
        var MessageSize = ListViewMessages[index].distance
        var MessageOpacity = CGFloat(ListViewMessages[index].elapsetime)
        var messageframe = CGRect(x: 0, y: 0, width: 200, height: MessageSize)
        listviews[index] = UIView(frame: messageframe)
        listviews[index].backgroundColor = UIColor(white: 1, alpha: MessageOpacity)
        return listviews
    }
}


func viewDidLoad() {

}


















