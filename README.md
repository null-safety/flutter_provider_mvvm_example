# better_mvvm_template

一个用于介绍 `Provider+MVVM架构` 的模板项目。

## Getting Started

### 关于 Provider

对 [InheritedWidget](https://api.flutter-io.cn/flutter/widgets/InheritedWidget-class.html) 组件的上层封装，使其更易用，更易复用。

关于 Provider 的介绍请参考 [pub - Provider](https://pub.flutter-io.cn/packages/provider)。

### 关于 MVVM

关于 MVVM 的介绍请参考 [维基百科 - MVVM](https://zh.wikipedia.org/zh-hans/MVVM)

#### MVVM架构：

![mvvm](https://s2.loli.net/2022/02/28/yJitlMHNdaKxPmQ.png)

- ##### Model

> 数据模型，仅用于描述当前数据状态。
>
> 示例项目中的 `Model`均为**immutable**（不可变），限定 `Model 的实例`与 `单次 api 请求结果`保持一致。

- ##### View Model

>视图数据模型，与 `Model`、`View` 双向绑定。
>
>负责对 `Model` 进行创建、销毁等一系列操作，同时对 `Model` 能力进行扩充。
>
>示例项目中的 `ViewModel` 由 `Provider` 暴露给 `WidgetTree`。

- ##### Screen

> View 层，负责一切UI相关事宜，例如 UI 事件绑定、UI 组件创建等等。
>
> 示例项目中统一继承自 `StatefulWidget`，因为 `State` 的生命周期更易于组件管理。

- ##### Screen Controller

> View 的辅助控制器，帮助 View 层执行一些逻辑实现。例如对象初始化、数据操作、数据组装等。

OK，我知道你可能有疑惑，这个 Controller 好像和 ViewModel 的职能重合了？

我们拿一个场景来举例，例如示例项目中的登录：

- [ ]  TODO：稍后再补充



### 目录结构

```
lib
├── app
├── commons
│   ├── extentions
│   ├── themes
│   ├── utils
│   ├── values
│   └── widgets
├── data
│   ├── models
│   └── repositorys
│       ├── local
│       └── remote
├── modules
│   ├── main
│   ├── main_home
│   ├── main_list
│   ├── main_mine
│   ├── sign_in
│   ├── sign_up
│   ├── undefine
│   └── welcome
├── routers
└── view_models
```

### lib/app

app根节点的widget，（除非真的必要，否则不建议为 `mobile`、`web` 等单独创建“app”)

```
lib/app
└── app.dart
```

### lib/commons

所有全局通用的 `.dart` 文件都应放到这个目录下

```
lib/commons
├── extentions      // 自定义的扩展
├── themes          // 主题配置
├── utils           // 工具类
├── values          // 一些编译时常量或运行时常量
└── widgets         // 通用的自定义组件
```

### lib/data

所有和数据相关的 `.dart` 文件都应放到这个目录下

```
lib/data
├── models          // 数据模型
└── repositorys
    ├── local       // 本地操作数据 例如 `local_cache`、`shared_preferences、db` 等等
    └── remote      // 远端数据操作 例如 `api` 调用等等
```

### lib/modules

所有业务模块的 `.dart` 文件都应放到这个目录下

```
lib/modules
├── main            // 主页
├── main_home       // 主页（首页tab选中）
├── main_list       // 主页（列表tab选中）
├── main_mine       // 主页（我的tab选中）
├── sign_in         // 登入
├── sign_up         // 注册
├── welcome         // 欢迎
└── ...
```

### lib/routers

所有和路由相关的 `.dart` 文件都应放到这个目录下

```
lib/routers
├── interceptor.dart    // 路由拦截器
├── register.dart       // 路由注册器
├── routers.dart        // 路由集合
└── ...
```

### lib/view_models

所有 `ViewModel` 的 `.dart` 文件都应放到这个目录下

```
lib/view_models             
├── view_model.dart         // 超类 用于抽象和定义规范
├── license_view_model.dart // license 权限控制
├── user_view_model.dart    // 用户信息
└── ...
```

TODO List：
- [x] 登录功能
    - [x] 模拟api请求
    - [ ]  登录状态缓存，下次打开直接登录
- [x] 主页Tab
    - [x] 模拟api请求
- [ ] 完善文档
- [ ] 使用 Navigator2
- [ ] 补充其余分支逻辑

