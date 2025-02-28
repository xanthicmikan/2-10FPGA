<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="XLXN_1" />
        <signal name="XLXN_2" />
        <signal name="XLXN_5" />
        <signal name="XLXN_6" />
        <signal name="A" />
        <signal name="B" />
        <signal name="SEL" />
        <signal name="Q" />
        <port polarity="Input" name="A" />
        <port polarity="Input" name="B" />
        <port polarity="Input" name="SEL" />
        <port polarity="Output" name="Q" />
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <block symbolname="and2" name="XLXI_1">
            <blockpin signalname="XLXN_1" name="I0" />
            <blockpin signalname="A" name="I1" />
            <blockpin signalname="XLXN_5" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_2">
            <blockpin signalname="XLXN_2" name="I0" />
            <blockpin signalname="B" name="I1" />
            <blockpin signalname="XLXN_6" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_3">
            <blockpin signalname="XLXN_6" name="I0" />
            <blockpin signalname="XLXN_5" name="I1" />
            <blockpin signalname="Q" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_4">
            <blockpin signalname="SEL" name="I" />
            <blockpin signalname="XLXN_1" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_5">
            <blockpin signalname="XLXN_1" name="I" />
            <blockpin signalname="XLXN_2" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="1344" y="1040" name="XLXI_1" orien="R0" />
        <instance x="1344" y="1392" name="XLXI_2" orien="R0" />
        <instance x="1872" y="1216" name="XLXI_3" orien="R0" />
        <instance x="576" y="1600" name="XLXI_4" orien="R0" />
        <instance x="928" y="1600" name="XLXI_5" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="832" y1="1568" y2="1568" x1="800" />
            <wire x2="928" y1="1568" y2="1568" x1="832" />
            <wire x2="1344" y1="976" y2="976" x1="832" />
            <wire x2="832" y1="976" y2="1568" x1="832" />
        </branch>
        <branch name="XLXN_2">
            <wire x2="1248" y1="1568" y2="1568" x1="1152" />
            <wire x2="1248" y1="1328" y2="1568" x1="1248" />
            <wire x2="1344" y1="1328" y2="1328" x1="1248" />
        </branch>
        <branch name="XLXN_5">
            <wire x2="1728" y1="944" y2="944" x1="1600" />
            <wire x2="1728" y1="944" y2="1088" x1="1728" />
            <wire x2="1872" y1="1088" y2="1088" x1="1728" />
        </branch>
        <branch name="XLXN_6">
            <wire x2="1728" y1="1296" y2="1296" x1="1600" />
            <wire x2="1728" y1="1152" y2="1296" x1="1728" />
            <wire x2="1872" y1="1152" y2="1152" x1="1728" />
        </branch>
        <branch name="A">
            <wire x2="1328" y1="912" y2="912" x1="1152" />
            <wire x2="1344" y1="912" y2="912" x1="1328" />
        </branch>
        <branch name="B">
            <wire x2="1328" y1="1264" y2="1264" x1="1152" />
            <wire x2="1344" y1="1264" y2="1264" x1="1328" />
        </branch>
        <branch name="SEL">
            <wire x2="576" y1="1568" y2="1568" x1="544" />
        </branch>
        <iomarker fontsize="28" x="544" y="1568" name="SEL" orien="R180" />
        <branch name="Q">
            <wire x2="2160" y1="1120" y2="1120" x1="2128" />
        </branch>
        <iomarker fontsize="28" x="2160" y="1120" name="Q" orien="R0" />
        <iomarker fontsize="28" x="1152" y="1264" name="B" orien="R180" />
        <iomarker fontsize="28" x="1152" y="912" name="A" orien="R180" />
    </sheet>
</drawing>