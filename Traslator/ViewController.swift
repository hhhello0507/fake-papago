//
//  ViewController.swift
//  Traslator
//
//  Created by hhhello0507 on 9/19/24.
//

import UIKit
import SnapKit
import Then
import MLKit

struct MyTranslator {
    
    private let options: TranslatorOptions
    private let translator: Translator
    
    static let shared = Self()
    
    private init() {
        options = TranslatorOptions(sourceLanguage: .korean, targetLanguage: .english)
        translator = Translator.translator(options: options)
        let conditions = ModelDownloadConditions(
            allowsCellularAccess: false, // 셀룰러 허용 여부
            allowsBackgroundDownloading: true // 백그라운드 다운 허용 여부
        )
        translator.downloadModelIfNeeded(with: conditions) { err in
            if let err {
                print("언어 모델 다운 실패: \(err)")
                return
            }
            print("언어 모델 다운 완료")
        }
    }
    
    func translate(text: String, completion: @escaping TranslatorCallback) {
        translator.translate(text, completion: completion)
    }
}

final class ViewController: UIViewController {
    
    private let _view = View()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = _view
        _view.textView.delegate = self
        _view.recordButton.addTarget(self, action: #selector(record), for: .touchUpInside)
        navigationItem.title = "🫠 Fake papago"
        hideKeyboardWhenTappedAround()
    }
    
    @objc
    func record() {
        print("record")
    }
}

extension ViewController: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "여기에 입력하세요"
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textViewDidChange(_ textView: UITextView) {
        MyTranslator.shared.translate(text: textView.text) { [self] text, err in
            if let err {
                print("번역 에러: \(err)")
                _view.result.text = "..."
                return
            }
            guard let text else { return }
            _view.result.text = text
        }
    }
}

final class View: UIView {
    
    lazy var scrollView = UIScrollView()
    lazy var rootStack = UIStackView().then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .fill
        $0.spacing = 16
    }
    
    lazy var textView = UITextView().then {
        $0.text = "여기에 입력하세요"
        $0.font = .systemFont(ofSize: 22, weight: .bold)
        $0.textContainerInset = .init(top: 16, left: 12, bottom: 16, right: 12)
        $0.textColor = UIColor.lightGray
        $0.backgroundColor = .white
        $0.tintColor = UIColor(0x1CFF6B)
        $0.layer.do {
            $0.masksToBounds = false
            $0.shadowColor = UIColor.black.cgColor
            $0.shadowOffset = .init(width: 0, height: 4)
            $0.shadowRadius = 5
            $0.shadowOpacity = 0.04
            $0.cornerRadius = 15
        }
    }
    
    lazy var result = UILabel().then {
        $0.text = ""
        $0.textColor = .black
        $0.font = .systemFont(ofSize: 44, weight: .bold)
        $0.numberOfLines = 0
        $0.lineBreakMode = .byWordWrapping
    }
    
    lazy var recordButton = UIButton(type: .system).then {
        $0.setBackgroundImage(.pixel(ofColor: UIColor(0x1CFF6B)), for: .normal)
        $0.layer.cornerRadius = 8
        let i = UIImage(named: "Record")?.withRenderingMode(.alwaysTemplate)
        $0.setImage(i, for: .normal)
        $0.tintColor = .black
        $0.layer.masksToBounds = true
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        backgroundColor = .white
        _ = addSubviews(
            scrollView.addSubviews(
                rootStack.addArrangedSubviews(
                    UISpacer(height: 24),
                    textView,
                    result
                )
            ),
            recordButton
        )
        scrollView.snp.makeConstraints {
            $0.edges.equalTo(safeAreaLayoutGuide)
        }
        rootStack.snp.makeConstraints {
            $0.horizontalEdges.equalTo(scrollView.frameLayoutGuide)
            $0.verticalEdges.equalTo(scrollView.contentLayoutGuide)
        }
        textView.snp.makeConstraints {
            $0.height.equalTo(120)
            $0.horizontalEdges.equalToSuperview().inset(16)
        }
        result.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(10)
        }
        recordButton.snp.makeConstraints {
            $0.horizontalEdges.equalToSuperview().inset(12)
            $0.height.equalTo(64)
            $0.bottom.equalTo(safeAreaLayoutGuide).offset(-16)
        }
    }
}

#Preview {
    ViewController()
}
