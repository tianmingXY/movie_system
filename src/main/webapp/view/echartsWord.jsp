<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>柱状图</title>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.bootcdn.net/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- 引入 echarts.js -->
    <script src="https://cdn.staticfile.org/echarts/4.7.0/echarts.min.js"></script>
</head>
<body>
<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
<div id="main" style="width: 80%;height:600px;margin: 20px auto;"></div>
<script type="text/javascript">

    function getpieChart() {
        // 基于准备好的dom，初始化echarts实例
        var myChart = echarts.init(document.getElementById('main'));
        // 指定图表的配置项和数据
        var option = {
            title: {
                text: '评论分词统计浏览统计图',
                x: 'center',
                y: '7px',
                textStyle: {
                    color: '#3A7BD5',
                    fontSize: 20
                },
                textAlign: 'left'
            },
            //工具箱，每个图表最多仅有一个工具箱
            toolbox: {
                //显示策略，可选为：true（显示） | false（隐藏），默认值为false
                show: true,
                //启用功能，目前支持feature，工具箱自定义功能回调处理
                feature: {
                    //辅助线标志
                    mark: {show: true},
                    //dataZoom，框选区域缩放，自动与存在的dataZoom控件同步，分别是启用，缩放后退
                    dataZoom: {
                        show: true,
                        title: {
                            dataZoom: '区域缩放',
                            dataZoomReset: '区域缩放后退'
                        }
                    },
                    //数据视图，打开数据视图，可设置更多属性,readOnly 默认数据视图为只读(即值为true)，可指定readOnly为false打开编辑功能
                    dataView: {show: true, readOnly: true},
                    //magicType，动态类型切换，支持直角系下的折线图、柱状图、堆积、平铺转换
                    magicType: {show: true, type: ['line', 'bar']},
                    //restore，还原，复位原始图表
                    restore: {show: true},
                    //saveAsImage，保存图片（IE8-不支持）,图片类型默认为'png'
                    saveAsImage: {show: true}
                }
            },
            tooltip: {},
            legend: {
                data: ['分词']
            },
            xAxis: {
                name: "词名",
                data: [${names}]
            },
            yAxis: {
                name: "次数",
            },
            series: [{
                name: '出现次数',
                type: 'bar',
                data: [${values}]
            }]
        };

        // 使用刚指定的配置项和数据显示图表。
        myChart.setOption(option);

    }

    getpieChart();
</script>
</body>
</html>
