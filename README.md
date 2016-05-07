##家谱树的实现
###需求
* 需要做一个家谱树，有表格，有树形视图。每一行表格描述某代人的信息。家谱树视图每一代枝叶与cell一一对应，且位置处在同一行。
* 表格和家谱树可以同时纵向滚动，相对位置不变；
* 表格和家谱树可以同时进行缩放；
* 家谱树可以横向滚动，表格不可以。

###UI实现思路
tableView内嵌scrollview，scrollview中放置家谱树。

###如何实现
####1. 首先要清楚tableView的子视图结构
通过Reveal分析可知，tableView的第一个子视图名字叫做UITableViewWrapperView，用于存放所有的cell，我们滚动tableView浏览视图时，实际上滚动的是这个子视图。

####2. 如何缩放tableView
根据第1条，我们知道对tableView的所有操作实际上是对UITableViewWrapperView进行的，那么我们试一下UITableViewWrapperView是否可以缩放？通过UIScrollview的代理方法验证一下，果然，可以看到表格被放大或缩小了！

	-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    	return _tableView.subviews.firstObject;//UITableViewWrapperView就是tableView的第一个子视图
	}

####3. 添加家谱树
既然可以缩放tableView了，那么剩下就是怎样将家谱树添加到tableView的UITableViewWrapperView上，这样在缩放时就能达到表格和家谱树同时缩放的效果。
很简单，在UITableViewWrapperView上添加一个frame相同的UIScrollview即可！

####4. 总结
demo中的家谱树用简单的label展示，主要看思路。

