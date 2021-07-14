# VIPER
## Meaning
- View
	- ViewController
	- protocol
	- referencet to Presenter

- Interactor
	- データの取得や、相互作用（ViewModelのような？）仕事をおこなう
	- Object
	- protocol
	- reference to Presenter
	
- Presenter 
	- 橋渡し的な？
	- Object
	- protocol
	- reference to Interactor, Router, View

- Entity
	- Model
	
- Router
	- アプリケーション独自のルーティングを行う
	- Object
	- Entry Point

## 流れ
1. SceneDelegate: windowの作成、rootViewControllerの設定、routerのstart, entity設定
2. Router: view, presenter, interactorの設定、routerのentityの設定
3. View: 設定
4. Presenter: Interactorの設定、Interactorのメソッドをコール
5. Interactor: （今回は）APIコール、Presenterに返す
6. Presenter: Viewに値を渡す
7. View: 値の表示