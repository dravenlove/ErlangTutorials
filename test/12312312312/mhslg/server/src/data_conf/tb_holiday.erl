%%--- coding:utf-8 ---
-module(tb_holiday).
-export([get/1,get_list/0]).
get(2020)-> #{
    'jieqi_test' => 1596384000,
    'jieqi_li_chun' => 1580659200,
    'jieqi_yu_shui' => 1582041600,
    'jieqi_jing_zhe' => 1583337600,
    'jieqi_chun_fen' => 1584633600,
    'jieqi_qing_ming' => 1585929600,
    'jieqi_gu_yu' => 1587225600,
    'jieqi_li_xia' => 1588608000,
    'jieqi_xiao_man' => 1589904000,
    'jieqi_mang_zhong' => 1591286400,
    'jieqi_xia_zhi' => 1592668800,
    'jieqi_xiao_shu' => 1593964800,
    'jieqi_da_shu' => 1595347200,
    'jieqi_li_qiu' => 1596729600,
    'jieqi_chu_shu' => 1598025600,
    'jieqi_bai_lu' => 1599408000,
    'jieqi_qiu_fen' => 1600704000,
    'jieqi_han_lu' => 1602086400,
    'jieqi_shuang_jiang' => 1603382400,
    'jieqi_li_dong' => 1604678400,
    'jieqi_xiao_xue' => 1605974400,
    'jieqi_da_xue' => 1607270400,
    'jieqi_dong_zhi' => 1608480000,
    'jieqi_xiao_han' => 1578240000,
    'jieqi_da_han' => 1579449600,
    'cn_xiao_nian' => 1579190400,
    'cn_chun_jie' => 1579881600,
    'cn_yuan_xiao' => 1581091200,
    'cn_long_tai_tou' => 1582473600,
    'it_mu_qin_jie' => 1589904000,
    'cn_duan_wu_jie' => 1592236800,
    'it_fu_qin_jie' => 1592582400,
    'cn_qi_xi_jie' => 1597248000,
    'cn_zhong_yuan_jie' => 1597852800,
    'cn_zhong_qiu_jie' => 1600531200,
    'cn_zhong_yang_jie' => 1603123200,
    'it_gan_en_jie' => 1606320000,
    'cn_la_ba_jie' => 1606320000
};
get(2021)-> #{
    'jieqi_test' => 1628092800,
    'jieqi_li_chun' => 1612281600,
    'jieqi_yu_shui' => 1613577600,
    'jieqi_jing_zhe' => 1614873600,
    'jieqi_chun_fen' => 1616169600,
    'jieqi_qing_ming' => 1617465600,
    'jieqi_gu_yu' => 1618848000,
    'jieqi_li_xia' => 1620144000,
    'jieqi_xiao_man' => 1621526400,
    'jieqi_mang_zhong' => 1622822400,
    'jieqi_xia_zhi' => 1624204800,
    'jieqi_xiao_shu' => 1625587200,
    'jieqi_da_shu' => 1626883200,
    'jieqi_li_qiu' => 1628265600,
    'jieqi_chu_shu' => 1629648000,
    'jieqi_bai_lu' => 1630944000,
    'jieqi_qiu_fen' => 1632326400,
    'jieqi_han_lu' => 1633622400,
    'jieqi_shuang_jiang' => 1634918400,
    'jieqi_li_dong' => 1636214400,
    'jieqi_xiao_xue' => 1637510400,
    'jieqi_da_xue' => 1638806400,
    'jieqi_dong_zhi' => 1640016000,
    'jieqi_xiao_han' => 1609776000,
    'jieqi_da_han' => 1611072000,
    'cn_xiao_nian' => 1612368000,
    'cn_chun_jie' => 1613059200,
    'cn_yuan_xiao' => 1614268800,
    'cn_long_tai_tou' => 1615651200,
    'it_mu_qin_jie' => 1620489600,
    'cn_duan_wu_jie' => 1623600000,
    'it_fu_qin_jie' => 1624118400,
    'cn_qi_xi_jie' => 1628870400,
    'cn_zhong_yuan_jie' => 1629561600,
    'cn_zhong_qiu_jie' => 1632153600,
    'cn_zhong_yang_jie' => 1634140800,
    'it_gan_en_jie' => 1637769600,
    'cn_la_ba_jie' => 1611072000
};
get(2022)-> #{
    'jieqi_test' => 1659715200,
    'jieqi_li_chun' => 1643904000,
    'jieqi_yu_shui' => 1645200000,
    'jieqi_jing_zhe' => 1646409600,
    'jieqi_chun_fen' => 1647705600,
    'jieqi_qing_ming' => 1649088000,
    'jieqi_gu_yu' => 1650384000,
    'jieqi_li_xia' => 1651680000,
    'jieqi_xiao_man' => 1653062400,
    'jieqi_mang_zhong' => 1654444800,
    'jieqi_xia_zhi' => 1655740800,
    'jieqi_xiao_shu' => 1657123200,
    'jieqi_da_shu' => 1658505600,
    'jieqi_li_qiu' => 1659801600,
    'jieqi_chu_shu' => 1661184000,
    'jieqi_bai_lu' => 1662480000,
    'jieqi_qiu_fen' => 1663862400,
    'jieqi_han_lu' => 1665158400,
    'jieqi_shuang_jiang' => 1666454400,
    'jieqi_li_dong' => 1667750400,
    'jieqi_xiao_xue' => 1669046400,
    'jieqi_da_xue' => 1670342400,
    'jieqi_dong_zhi' => 1671638400,
    'jieqi_xiao_han' => 1641312000,
    'jieqi_da_han' => 1642608000,
    'cn_xiao_nian' => 1643040000,
    'cn_chun_jie' => 1643644800,
    'cn_yuan_xiao' => 1644854400,
    'cn_long_tai_tou' => 1646323200,
    'it_mu_qin_jie' => 1651939200,
    'cn_duan_wu_jie' => 1654185600,
    'it_fu_qin_jie' => 1655568000,
    'cn_qi_xi_jie' => 1659542400,
    'cn_zhong_yuan_jie' => 1597161600,
    'cn_zhong_qiu_jie' => 1662739200,
    'cn_zhong_yang_jie' => 1664812800,
    'it_gan_en_jie' => 1669219200,
    'cn_la_ba_jie' => 1641744000
};
get(2023)-> #{
    'jieqi_test' => 1686844800,
    'jieqi_li_chun' => 1675440000,
    'jieqi_yu_shui' => 1676736000,
    'jieqi_jing_zhe' => 1678032000,
    'jieqi_chun_fen' => 1679328000,
    'jieqi_qing_ming' => 1680624000,
    'jieqi_gu_yu' => 1681920000,
    'jieqi_li_xia' => 1683302400,
    'jieqi_xiao_man' => 1684598400,
    'jieqi_mang_zhong' => 1685980800,
    'jieqi_xia_zhi' => 1687276800,
    'jieqi_xiao_shu' => 1688659200,
    'jieqi_da_shu' => 1690041600,
    'jieqi_li_qiu' => 1691424000,
    'jieqi_chu_shu' => 1692720000,
    'jieqi_bai_lu' => 1694102400,
    'jieqi_qiu_fen' => 1695398400,
    'jieqi_han_lu' => 1696694400,
    'jieqi_shuang_jiang' => 1698076800,
    'jieqi_li_dong' => 1699372800,
    'jieqi_xiao_xue' => 1700582400,
    'jieqi_da_xue' => 1701878400,
    'jieqi_dong_zhi' => 1703174400,
    'jieqi_xiao_han' => 1672848000,
    'jieqi_da_han' => 1674144000,
    'cn_xiao_nian' => 1673625600,
    'cn_chun_jie' => 1674316800,
    'cn_yuan_xiao' => 1675526400,
    'cn_long_tai_tou' => 1676908800,
    'it_mu_qin_jie' => 1683993600,
    'cn_duan_wu_jie' => 1687363200,
    'it_fu_qin_jie' => 1687017600,
    'cn_qi_xi_jie' => 1692633600,
    'cn_zhong_yuan_jie' => 1693324800,
    'cn_zhong_qiu_jie' => 1695916800,
    'cn_zhong_yang_jie' => 1697990400,
    'it_gan_en_jie' => 1700668800,
    'cn_la_ba_jie' => 1672329600
};
get(2024)-> #{
    'jieqi_test' => 1718467200,
    'jieqi_li_chun' => 1706976000,
    'jieqi_yu_shui' => 1708272000,
    'jieqi_jing_zhe' => 1709568000,
    'jieqi_chun_fen' => 1710864000,
    'jieqi_qing_ming' => 1712160000,
    'jieqi_gu_yu' => 1713456000,
    'jieqi_li_xia' => 1714838400,
    'jieqi_xiao_man' => 1716134400,
    'jieqi_mang_zhong' => 1717516800,
    'jieqi_xia_zhi' => 1718899200,
    'jieqi_xiao_shu' => 1720195200,
    'jieqi_da_shu' => 1721577600,
    'jieqi_li_qiu' => 1722960000,
    'jieqi_chu_shu' => 1724256000,
    'jieqi_bai_lu' => 1725638400,
    'jieqi_qiu_fen' => 1726934400,
    'jieqi_han_lu' => 1728316800,
    'jieqi_shuang_jiang' => 1729612800,
    'jieqi_li_dong' => 1730908800,
    'jieqi_xiao_xue' => 1732204800,
    'jieqi_da_xue' => 1733414400,
    'jieqi_dong_zhi' => 1734710400,
    'jieqi_xiao_han' => 1704470400,
    'jieqi_da_han' => 1705680000,
    'cn_xiao_nian' => 1706803200,
    'cn_chun_jie' => 1707494400,
    'cn_yuan_xiao' => 1708704000,
    'cn_long_tai_tou' => 1710086400,
    'it_mu_qin_jie' => 1715443200,
    'cn_duan_wu_jie' => 1717948800,
    'it_fu_qin_jie' => 1718467200,
    'cn_qi_xi_jie' => 1723219200,
    'cn_zhong_yuan_jie' => 1723910400,
    'cn_zhong_qiu_jie' => 1726502400,
    'cn_zhong_yang_jie' => 1728576000,
    'it_gan_en_jie' => 1732723200,
    'cn_la_ba_jie' => 1705507200
};
get(2025)-> #{
    'jieqi_test' => 1750003200,
    'jieqi_li_chun' => 1738512000,
    'jieqi_yu_shui' => 1739808000,
    'jieqi_jing_zhe' => 1741104000,
    'jieqi_chun_fen' => 1742400000,
    'jieqi_qing_ming' => 1743696000,
    'jieqi_gu_yu' => 1745078400,
    'jieqi_li_xia' => 1746374400,
    'jieqi_xiao_man' => 1747756800,
    'jieqi_mang_zhong' => 1749052800,
    'jieqi_xia_zhi' => 1750435200,
    'jieqi_xiao_shu' => 1751817600,
    'jieqi_da_shu' => 1753113600,
    'jieqi_li_qiu' => 1754496000,
    'jieqi_chu_shu' => 1755878400,
    'jieqi_bai_lu' => 1757174400,
    'jieqi_qiu_fen' => 1758556800,
    'jieqi_han_lu' => 1759852800,
    'jieqi_shuang_jiang' => 1761148800,
    'jieqi_li_dong' => 1762444800,
    'jieqi_xiao_xue' => 1763740800,
    'jieqi_da_xue' => 1765036800,
    'jieqi_dong_zhi' => 1766246400,
    'jieqi_xiao_han' => 1736006400,
    'jieqi_da_han' => 1737302400,
    'cn_xiao_nian' => 1737475200,
    'cn_chun_jie' => 1738080000,
    'cn_yuan_xiao' => 1739289600,
    'cn_long_tai_tou' => 1740758400,
    'it_mu_qin_jie' => 1746892800,
    'cn_duan_wu_jie' => 1748620800,
    'it_fu_qin_jie' => 1749916800,
    'cn_qi_xi_jie' => 1756396800,
    'cn_zhong_yuan_jie' => 1757088000,
    'cn_zhong_qiu_jie' => 1759680000,
    'cn_zhong_yang_jie' => 1761667200,
    'it_gan_en_jie' => 1764172800,
    'cn_la_ba_jie' => 1736179200
};
get(2026)-> #{
    'jieqi_test' => 1781539200,
    'jieqi_li_chun' => 1770134400,
    'jieqi_yu_shui' => 1771344000,
    'jieqi_jing_zhe' => 1772640000,
    'jieqi_chun_fen' => 1773936000,
    'jieqi_qing_ming' => 1775318400,
    'jieqi_gu_yu' => 1776614400,
    'jieqi_li_xia' => 1777910400,
    'jieqi_xiao_man' => 1779292800,
    'jieqi_mang_zhong' => 1780588800,
    'jieqi_xia_zhi' => 1781971200,
    'jieqi_xiao_shu' => 1783353600,
    'jieqi_da_shu' => 1784736000,
    'jieqi_li_qiu' => 1786032000,
    'jieqi_chu_shu' => 1787414400,
    'jieqi_bai_lu' => 1788710400,
    'jieqi_qiu_fen' => 1790092800,
    'jieqi_han_lu' => 1791388800,
    'jieqi_shuang_jiang' => 1792684800,
    'jieqi_li_dong' => 1793980800,
    'jieqi_xiao_xue' => 1795276800,
    'jieqi_da_xue' => 1796572800,
    'jieqi_dong_zhi' => 1797868800,
    'jieqi_xiao_han' => 1767542400,
    'jieqi_da_han' => 1768838400,
    'cn_xiao_nian' => 1770652800,
    'cn_chun_jie' => 1771257600,
    'cn_yuan_xiao' => 1772467200,
    'cn_long_tai_tou' => 1773936000,
    'it_mu_qin_jie' => 1778342400,
    'cn_duan_wu_jie' => 1781798400,
    'it_fu_qin_jie' => 1781971200,
    'cn_qi_xi_jie' => 1787068800,
    'cn_zhong_yuan_jie' => 1787760000,
    'cn_zhong_qiu_jie' => 1790265600,
    'cn_zhong_yang_jie' => 1792252800,
    'it_gan_en_jie' => 1795622400,
    'cn_la_ba_jie' => 1769356800
};
get(2027)-> #{
    'jieqi_test' => 1813075200,
    'jieqi_li_chun' => 1801670400,
    'jieqi_yu_shui' => 1802966400,
    'jieqi_jing_zhe' => 1804262400,
    'jieqi_chun_fen' => 1805558400,
    'jieqi_qing_ming' => 1806854400,
    'jieqi_gu_yu' => 1808150400,
    'jieqi_li_xia' => 1809532800,
    'jieqi_xiao_man' => 1810828800,
    'jieqi_mang_zhong' => 1812211200,
    'jieqi_xia_zhi' => 1813507200,
    'jieqi_xiao_shu' => 1814889600,
    'jieqi_da_shu' => 1816272000,
    'jieqi_li_qiu' => 1817654400,
    'jieqi_chu_shu' => 1818950400,
    'jieqi_bai_lu' => 1820332800,
    'jieqi_qiu_fen' => 1821628800,
    'jieqi_han_lu' => 1822924800,
    'jieqi_shuang_jiang' => 1824220800,
    'jieqi_li_dong' => 1825516800,
    'jieqi_xiao_xue' => 1826812800,
    'jieqi_da_xue' => 1828108800,
    'jieqi_dong_zhi' => 1829404800,
    'jieqi_xiao_han' => 1799078400,
    'jieqi_da_han' => 1800374400,
    'cn_xiao_nian' => 1801238400,
    'cn_chun_jie' => 1801843200,
    'cn_yuan_xiao' => 1803052800,
    'cn_long_tai_tou' => 1804521600,
    'it_mu_qin_jie' => 1809792000,
    'cn_duan_wu_jie' => 1812470400,
    'it_fu_qin_jie' => 1813420800,
    'cn_qi_xi_jie' => 1817654400,
    'cn_zhong_yuan_jie' => 1818345600,
    'cn_zhong_qiu_jie' => 1820937600,
    'cn_zhong_yang_jie' => 1822924800,
    'it_gan_en_jie' => 1827072000,
    'cn_la_ba_jie' => 1799942400
};
get(2028)-> #{
    'jieqi_test' => 1844697600,
    'jieqi_li_chun' => 1833206400,
    'jieqi_yu_shui' => 1834502400,
    'jieqi_jing_zhe' => 1835798400,
    'jieqi_chun_fen' => 1837094400,
    'jieqi_qing_ming' => 1838390400,
    'jieqi_gu_yu' => 1839686400,
    'jieqi_li_xia' => 1841068800,
    'jieqi_xiao_man' => 1842364800,
    'jieqi_mang_zhong' => 1843747200,
    'jieqi_xia_zhi' => 1845129600,
    'jieqi_xiao_shu' => 1846425600,
    'jieqi_da_shu' => 1847808000,
    'jieqi_li_qiu' => 1849190400,
    'jieqi_chu_shu' => 1850486400,
    'jieqi_bai_lu' => 1851868800,
    'jieqi_qiu_fen' => 1853164800,
    'jieqi_han_lu' => 1854547200,
    'jieqi_shuang_jiang' => 1855843200,
    'jieqi_li_dong' => 1857139200,
    'jieqi_xiao_xue' => 1858435200,
    'jieqi_da_xue' => 1859644800,
    'jieqi_dong_zhi' => 1860940800,
    'jieqi_xiao_han' => 1830700800,
    'jieqi_da_han' => 1831910400,
    'cn_xiao_nian' => 1831824000,
    'cn_chun_jie' => 1832428800,
    'cn_yuan_xiao' => 1833638400,
    'cn_long_tai_tou' => 1835107200,
    'it_mu_qin_jie' => 1841846400,
    'cn_duan_wu_jie' => 1843056000,
    'it_fu_qin_jie' => 1844870400,
    'cn_qi_xi_jie' => 1850832000,
    'cn_zhong_yuan_jie' => 1851523200,
    'cn_zhong_qiu_jie' => 1854115200,
    'cn_zhong_yang_jie' => 1856102400,
    'it_gan_en_jie' => 1858521600,
    'cn_la_ba_jie' => 1830528000
};
get(2029)-> #{
    'jieqi_test' => 1876233600,
    'jieqi_li_chun' => 1864742400,
    'jieqi_yu_shui' => 1866038400,
    'jieqi_jing_zhe' => 1867334400,
    'jieqi_chun_fen' => 1868630400,
    'jieqi_qing_ming' => 1869926400,
    'jieqi_gu_yu' => 1871308800,
    'jieqi_li_xia' => 1872604800,
    'jieqi_xiao_man' => 1873987200,
    'jieqi_mang_zhong' => 1875283200,
    'jieqi_xia_zhi' => 1876665600,
    'jieqi_xiao_shu' => 1878048000,
    'jieqi_da_shu' => 1879344000,
    'jieqi_li_qiu' => 1880726400,
    'jieqi_chu_shu' => 1882108800,
    'jieqi_bai_lu' => 1883404800,
    'jieqi_qiu_fen' => 1884787200,
    'jieqi_han_lu' => 1886083200,
    'jieqi_shuang_jiang' => 1887379200,
    'jieqi_li_dong' => 1888675200,
    'jieqi_xiao_xue' => 1889971200,
    'jieqi_da_xue' => 1891267200,
    'jieqi_dong_zhi' => 1892476800,
    'jieqi_xiao_han' => 1862236800,
    'jieqi_da_han' => 1863532800,
    'cn_xiao_nian' => 1865001600,
    'cn_chun_jie' => 1865606400,
    'cn_yuan_xiao' => 1866816000,
    'cn_long_tai_tou' => 1868284800,
    'it_mu_qin_jie' => 1873296000,
    'cn_duan_wu_jie' => 1876233600,
    'it_fu_qin_jie' => 1876320000,
    'cn_qi_xi_jie' => 1881504000,
    'cn_zhong_yuan_jie' => 1882195200,
    'cn_zhong_qiu_jie' => 1884700800,
    'cn_zhong_yang_jie' => 1886774400,
    'it_gan_en_jie' => 1889971200,
    'cn_la_ba_jie' => 1863705600
};
get(2030)-> #{
    'jieqi_test' => 1907769600,
    'jieqi_li_chun' => 1896364800,
    'jieqi_yu_shui' => 1897574400,
    'jieqi_jing_zhe' => 1898870400,
    'jieqi_chun_fen' => 1900166400,
    'jieqi_qing_ming' => 1901548800,
    'jieqi_gu_yu' => 1902844800,
    'jieqi_li_xia' => 1904140800,
    'jieqi_xiao_man' => 1905523200,
    'jieqi_mang_zhong' => 1906819200,
    'jieqi_xia_zhi' => 1908201600,
    'jieqi_xiao_shu' => 1909584000,
    'jieqi_da_shu' => 1910966400,
    'jieqi_li_qiu' => 1912262400,
    'jieqi_chu_shu' => 1913644800,
    'jieqi_bai_lu' => 1914940800,
    'jieqi_qiu_fen' => 1916323200,
    'jieqi_han_lu' => 1917619200,
    'jieqi_shuang_jiang' => 1918915200,
    'jieqi_li_dong' => 1920211200,
    'jieqi_xiao_xue' => 1921507200,
    'jieqi_da_xue' => 1922803200,
    'jieqi_dong_zhi' => 1924099200,
    'jieqi_xiao_han' => 1893772800,
    'jieqi_da_han' => 1895068800,
    'cn_xiao_nian' => 1895587200,
    'cn_chun_jie' => 1896278400,
    'cn_yuan_xiao' => 1897488000,
    'cn_long_tai_tou' => 1898870400,
    'it_mu_qin_jie' => 1904745600,
    'cn_duan_wu_jie' => 1906819200,
    'it_fu_qin_jie' => 1907769600,
    'cn_qi_xi_jie' => 1912089600,
    'cn_zhong_yuan_jie' => 1912780800,
    'cn_zhong_qiu_jie' => 1915372800,
    'cn_zhong_yang_jie' => 1917360000,
    'it_gan_en_jie' => 1922025600,
    'cn_la_ba_jie' => 1894291200
};

get(_N) -> false.
get_list() ->
	[2020,2021,2022,2023,2024,2025,2026,2027,2028,2029,2030].
