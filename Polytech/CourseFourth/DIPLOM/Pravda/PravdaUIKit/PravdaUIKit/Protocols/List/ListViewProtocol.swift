//
//  CollectionViewProtocol.swift
//  PravdaUIKit
//
//  Created by Дмитрий Матвеенко on 28.07.2020.
//  Copyright © 2020 GkFoxes. All rights reserved.
//

public protocol ListViewProtocol: UIView {
	var selectedItemHandler: ((IndexPath) -> Void)? { get set }
}
