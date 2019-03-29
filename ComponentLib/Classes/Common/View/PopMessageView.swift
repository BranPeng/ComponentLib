//
//  PopMessageView.swift
//  SamsNowiOS
//
//  Created by macuser on 2018/7/31.
//  Copyright © 2018年 Binfeng Peng - Vendor. All rights reserved.
//

import UIKit

@objc protocol PopMessageViewDelegte : NSObjectProtocol {
    
    func popMessageView(_ popMessageView:PopMessageView, didSelectIndex index: NSInteger, id: IndexPath)// 这里在类上加了 open 关键字 就可以回调出视图对象
}


class PopMessageView: UIView {
    private var leftContentMargin: CGFloat = 16
    private var leftTextMargin: CGFloat = 24
    private var topTextMargin: CGFloat = 20
    private var btnsBackViewH: CGFloat = 60
    private let btnTag: NSInteger = 20180801
    static var Id = IndexPath()

    
    weak open var delegate: PopMessageViewDelegte?
    // MARK: - View
    private lazy var titleLabel = UILabel(textColor: UIColor.samsClubVeryDarkGrey, lines: 2, font: 20, textAlignment: .left)
    private lazy var contenteLabel = UILabel(textColor: UIColor.samsClubVeryDarkGrey, lines: 5, font: 16, textAlignment: .left)
    let backView = UIButton()
    let btnsBackView = UIView()
    //MARK: - 重写构造方法  在其中调用设置子控件的方法
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = UIColor.white
        
        createSubviews()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - UI
    private func createSubviews() {
        self.backgroundColor = UIColor.clear
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: UIFont.Weight.medium)
        //back
        backView.backgroundColor = UIColor.black
        backView.alpha = 0.8
        addSubview(backView)
        backView.snp.makeConstraints { (make) in
            make.leading.trailing.top.bottom.equalToSuperview()
        }
        //
        let contentView = UIView()
        contentView.backgroundColor = UIColor.white
        addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(leftContentMargin)
            make.trailing.equalToSuperview().offset(-leftContentMargin)
        }
        //
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(topTextMargin)
            make.leading.equalToSuperview().offset(leftTextMargin)
            make.trailing.equalToSuperview().offset(-leftTextMargin)
        }
        contentView.addSubview(contenteLabel)
        contenteLabel.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(leftTextMargin)
            make.leading.equalToSuperview().offset(leftTextMargin)
            make.trailing.equalToSuperview().offset(-leftTextMargin)
        }
        contentView.addSubview(btnsBackView)
        btnsBackView.snp.makeConstraints { (make) in
            make.top.equalTo(contenteLabel.snp.bottom).offset(5)
            make.height.equalTo(btnsBackViewH)
            make.leading.bottom.trailing.equalToSuperview()
        }
    }
    
    //MARK: - public method
    class func showPopMessageView(delegate:PopMessageViewDelegte, titleStr:String , messageStr:String , btnTitleArr:Array<String>, id: IndexPath) {
        Id = id
        let messageView = PopMessageView(frame: UIScreen.main.bounds)
        if titleStr.isEmpty || messageStr.isEmpty{
            messageView.contenteLabel.snp.updateConstraints { (make) in
                make.top.equalTo(messageView.titleLabel.snp.bottom).offset(0)
            }
        }else if titleStr.isEmpty && messageStr.isEmpty{
            return
        }
        messageView.delegate = delegate
        messageView.titleLabel.text = titleStr
        messageView.contenteLabel.text = messageStr
        if btnTitleArr.count == 0 {
            messageView.btnsBackView.snp.updateConstraints { (make) in
                make.height.equalTo(0)
            }
            messageView.backView.addTarget(messageView, action: #selector(backBtnClick), for: .touchUpInside);
        }else {
            
            let superViewW = UIScreen.main.bounds.width - messageView.leftContentMargin * 2
            let superViewH = messageView.btnsBackViewH
            let btnSpacing = messageView.leftContentMargin// 按钮间距
            var oldBtnW = CGFloat(0.0)
            let btnFont = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.medium)
            for (index, btnTitleStr) in btnTitleArr.enumerated() {
                if btnTitleStr.isEmpty { continue}// 退出当前循环
                let btnW = UILabel.getWidthWith(btnTitleStr, andLabel: btnFont) + btnSpacing * 2
                let btnX = superViewW - oldBtnW - btnW
                oldBtnW += btnW// 添加控件宽度
                let btn = UIButton(frame: CGRect.init(x: btnX, y: 0, width: btnW, height: superViewH))
                btn.tag = index + messageView.btnTag// 索引
                btn.setTitle(btnTitleStr, for: .normal)
                btn.setTitleColor(UIColor.samsClubBlue, for: .normal)
                btn.titleLabel?.font = btnFont
                btn.addTarget(messageView, action: #selector(btnClick(btn:)), for: .touchUpInside);
                messageView.btnsBackView.addSubview(btn)
            }
        }
        UIApplication.shared.keyWindow?.addSubview(messageView)
    }
    public func hidePopMessageView() {// 隐藏的方法
        removeFromSuperview()
    }
    
    // MARK: - BtnClick
    @objc private func btnClick(btn: UIButton) {
        let index = btn.tag - btnTag
        // 代理回调索引
        delegate?.popMessageView(self, didSelectIndex: index, id: PopMessageView.Id)
    }
    @objc private func backBtnClick() {
        hidePopMessageView()
    }
    
    
}
