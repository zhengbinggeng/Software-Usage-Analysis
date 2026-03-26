
import streamlit as st
import pandas as pd
import plotly.express as px
import plotly.graph_objects as go
from datetime import datetime

# 设置页面布局
st.set_page_config(page_title="正版软件合规分析系统", layout="wide", page_icon="✅")

# 标题与说明
st.title("✅ 正版授权软件安装及使用情况分析系统")
st.markdown("基于Ipguard导出数据构建的可视化分析平台，助力企业软件合规管理。")

# 文件上传
st.sidebar.header("📊 数据上传")
uploaded_install = st.sidebar.file_uploader("上传软件安装清单（CSV/XLSX/XLS）", type=["csv", "xlsx", "xls"])
uploaded_usage = st.sidebar.file_uploader("上传软件使用频率表（CSV/XLSX/XLS）", type=["csv", "xlsx", "xls"])

if uploaded_install and uploaded_usage:
    # 加载数据
    if uploaded_install.name.endswith('.csv'):
        df_install = pd.read_csv(uploaded_install)
    else:
        df_install = pd.read_excel(uploaded_install)
    
    if uploaded_usage.name.endswith('.csv'):
        df_usage = pd.read_csv(uploaded_usage)
    else:
        df_usage = pd.read_excel(uploaded_usage)
    
    # 数据预处理（示例）
    df_install['安装时间'] = p