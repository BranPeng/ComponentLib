//
//  EpicKeyboardManager.swift
//  SamsNowiOS
//
//  Created by Jun Wang - Vendor on 2018/9/4.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

import UIKit


class EpicKeyboardManager: NSObject {
    static let manager = EpicKeyboardManager.init();
    
    weak var curView : UITextField?;
    
    weak var curViewController : UIViewController?
    
    weak var curScrollerView : UIScrollView?
    
    var orOffset:CGPoint?
    
    var enable : Bool?
    
    var curKeyBoardFrame : CGRect?
    
   @objc var isEnable : Bool{
        get{
            return enable ?? true;
        }
        set{
            enable = newValue;
            if newValue {
                NotificationCenter.default.addObserver(self, selector: #selector(textFieldBeginEditing(_:)), name: NSNotification.Name.UITextFieldTextDidBeginEditing, object: nil);
                NotificationCenter.default.addObserver(self, selector: #selector(keyboradWillApear(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil);
                NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillDisapear(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil);
            }else{
                NotificationCenter.default.removeObserver(self);
            }
        }
    }
    
    @objc static func instance() -> EpicKeyboardManager{
        return manager;
    }
    
   private  override init() {
        super.init()
        isEnable = true;
       
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func setContentOffsetIfNoHideKeyboard(_ duration:CGFloat) {
        let curFieldRect = curView?.convert(curView!.bounds, to: curViewController?.view.window);
        if let _ = curFieldRect {
            let dis = curKeyBoardFrame!.minY - curFieldRect!.maxY - UIScreen.pxByWidthRatio(value: 14);
            var offsetY = curScrollerView!.contentOffset.y - dis;
            if offsetY < 0{
                offsetY = 0;
            }
            UIView.animate(withDuration: TimeInterval(duration)) {[weak self] in
                self?.curScrollerView?.contentOffset = CGPoint(x: self!.curScrollerView!.contentOffset.x, y: offsetY);
            }
            orOffset = curScrollerView?.contentOffset;
        }
    }
    
    @objc func textFieldBeginEditing(_ notification:NSNotification){
        curView = notification.object as? UITextField;
        curViewController = curView?.viewController();
        curScrollerView = curView?.scrollView();
        if let _ = curScrollerView, let _ = curKeyBoardFrame, curKeyBoardFrame!.minY < EpicGlobalConstants.EpicScreenHeight {
            if let _ = curView{
                setContentOffsetIfNoHideKeyboard(0.25);
            }
        }
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self);
    }
    
  
    
    @objc func keyboradWillApear(_ notification:NSNotification){
        let keyRect = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? CGRect;
        curKeyBoardFrame = keyRect;
      
        let curFieldRect = curView?.convert(curView!.bounds, to: curViewController?.view.window);
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as? CGFloat;
        guard let _ = curFieldRect else {
            reset()
            return;
        }
        if (keyRect?.midY)! >= EpicGlobalConstants.EpicScreenHeight {
            reset();
        }else{
            if keyRect!.minY - curFieldRect!.maxY < 0{
                let dis = curFieldRect!.maxY - keyRect!.minY;
                animation(duration!, animaDis: dis);
            }else{
                if let _ = curScrollerView, let _ = curKeyBoardFrame, curKeyBoardFrame!.minY < EpicGlobalConstants.EpicScreenHeight {
                    if let _ = curView{
                        setContentOffsetIfNoHideKeyboard(duration ?? 0.25);
                    }
                }
            }
        }
    }
    
    @objc func keyboardWillDisapear(_ notification:NSNotification){
        let duration = notification.userInfo![UIKeyboardAnimationDurationUserInfoKey] as? CGFloat;
        let keyRect = notification.userInfo![UIKeyboardFrameEndUserInfoKey] as? CGRect;
        curKeyBoardFrame = keyRect;
        reductionAnim(duration!);
        reset();
    }
    
    func reset(){
        curView = nil;
        curScrollerView = nil;
        curViewController = nil;
    }
    
    func animation(_ animDuration:CGFloat,animaDis:CGFloat){
        guard let _ = curScrollerView else {
            reset();
            return ;
        }
        orOffset = curScrollerView?.contentOffset;
        UIView.animate(withDuration: TimeInterval(animDuration)) {[weak self] in
            self?.curScrollerView?.contentOffset = CGPoint(x: self!.orOffset!.x, y: self!.orOffset!.y + animaDis + UIScreen.pxByWidthRatio(value: 14));
        }
    }
    func reductionAnim(_ animDuration:CGFloat){
        guard let _ = curScrollerView else {
            return ;
        }
        guard let _ = self.orOffset else {
            return;
        }
        UIView.animate(withDuration: TimeInterval(animDuration)) {[weak self] in
            self?.curScrollerView?.contentOffset = (self?.orOffset)!;
        }
        self.orOffset = nil;
    }

}
