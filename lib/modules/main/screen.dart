 
import 'package:flutter/material.dart';
import 'package:flutter_provider_mvvm_example/commons/widgets/screen_indicator.dart';
import 'package:flutter_provider_mvvm_example/modules/main_home/screen.dart';
import 'package:flutter_provider_mvvm_example/modules/main_mine/screen.dart';
import 'package:flutter_provider_mvvm_example/view_models/license_view_model.dart';
import 'package:flutter_provider_mvvm_example/view_models/user_view_model.dart';
import 'package:provider/provider.dart';

/// 主页面
class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController? tabController;

  @override
  Widget build(BuildContext context) {
    // 用户未登录 首页无法访问
    if (!context.watch<UserViewModel>().hasModel) {
      return const ScreenIndicator();
    }

    /// 权限菜单获取。
    /// - 获取中，过程中返回一个加载指示器。
    /// - 获取成功，返回对应的视图
    final license = context.watch<LicenseViewModel>();
    if (!license.hasModel) return const ScreenIndicator();

    tabController =
        TabController(length: license.model.menus.length, vsync: this);

    return Scaffold(
      body: TabBarView(
        controller: tabController,
        children: license.model.menus.map(_buildSingleScreen).toList(),
      ),
      bottomNavigationBar: Container(
        color: Colors.blueAccent,
        child: SafeArea(
          child: TabBar(
            controller: tabController,
            tabs: license.model.menus.map(_buildSingleTab).toList(),
          ),
        ),
      ),
    );
  }

  /// 构建 [label] 对应的单个页面
  Widget _buildSingleScreen(String label) {
    if (label.contains('首页')) return const HomeScreen();
    if (label.contains('更多')) return const Center(child: Text('unknow'));
    if (label.contains('列表')) return const Center(child: Text('unknow'));
    if (label.contains('我的')) return const MineScreen();
    return const Center(child: Text('Undefined Screen'));
  }

  /// 构建 [label] 对应的单个 [Tab]
  Widget _buildSingleTab(String label) {
    if (label.contains('更多')) {
      return Tab(icon: const Icon(Icons.more), child: Text(label));
    }
    if (label.contains('首页')) {
      return Tab(icon: const Icon(Icons.home), child: Text(label));
    }
    if (label.contains('列表')) {
      return Tab(icon: const Icon(Icons.list), child: Text(label));
    }
    if (label.contains('我的')) {
      return Tab(icon: const Icon(Icons.account_box), child: Text(label));
    }
    return const Tab(child: Text('Undefined Label'));
  }
}
