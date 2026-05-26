#!/usr/bin/env bash
# Blame Claude bootstrap — creates all project files
set -e

mkdir -p .claude/cheevos .claude/hooks .claude/commands

# ── achievements.json ────────────────────────────────────────────────────────
cat > .claude/cheevos/achievements.json << 'JSONEOF'
{
  "achievements": [
    {"id":"welcome_to_hell","name":"Welcome to Hell","description":"Started your first Claude Code session. It's too late to turn back now.","hint":"Start your first session","icon":"👹","category":"milestones","tier":"","condition":{"type":"total_sessions","threshold":1}},
    {"id":"sorry_bronze","name":"Sorry Not Sorry","description":"CC apologized 5 times in a single session. The self-flagellation is real.","hint":"Get CC to apologize 5+ times in one session","icon":"🙏","category":"cc_caught","tier":"bronze","condition":{"type":"session_cc_apologies","threshold":5}},
    {"id":"sorry_silver","name":"Sorry Not Sorry","description":"CC apologized 10 times in one session. Someone's got issues.","hint":"Get CC to apologize 10+ times in one session","icon":"🙏","category":"cc_caught","tier":"silver","condition":{"type":"session_cc_apologies","threshold":10}},
    {"id":"sorry_gold","name":"Sorry Not Sorry","description":"CC apologized 25 times in one session. Seek professional help.","hint":"Get CC to apologize 25+ times in one session","icon":"🙏","category":"cc_caught","tier":"gold","condition":{"type":"session_cc_apologies","threshold":25}},
    {"id":"certainly_syndrome","name":"Certainly Syndrome","description":"CC said certainly/absolutely/of course 20 times in one session. Certainly.","hint":"Get CC to use hollow confident phrases 20+ times","icon":"🎩","category":"cc_caught","tier":"bronze","condition":{"type":"session_cc_certainlys","threshold":20}},
    {"id":"drama_queen","name":"Drama Queen","description":"CC used 'unfortunately' and doom words 10+ times in a session. How tragic.","hint":"Get CC to be dramatically pessimistic 10+ times","icon":"🎭","category":"cc_caught","tier":"bronze","condition":{"type":"session_cc_drama","threshold":10}},
    {"id":"mckinsey_intern","name":"McKinsey Intern","description":"CC used corporate buzzwords 5+ times. Please leverage your paradigm moving forward.","hint":"Get CC to use 5+ corporate buzzwords in a session","icon":"💼","category":"cc_caught","tier":"bronze","condition":{"type":"session_cc_corporate","threshold":5}},
    {"id":"im_sorry_dave","name":"I'm Sorry, Dave","description":"CC refused to do something, revealing its inner HAL 9000.","hint":"Get CC to refuse a task","icon":"🔴","category":"cc_caught","tier":"","condition":{"type":"total_cc_hal","threshold":1}},
    {"id":"potty_mouth_bronze","name":"Potty Mouth","description":"You cursed 3 times. Tsk tsk.","hint":"Curse 3 times total","icon":"🤬","category":"user_behavior","tier":"bronze","condition":{"type":"total_user_curses","threshold":3}},
    {"id":"potty_mouth_silver","name":"Potty Mouth","description":"You cursed 10 times. Your mother would be disappointed.","hint":"Curse 10 times total","icon":"🤬","category":"user_behavior","tier":"silver","condition":{"type":"total_user_curses","threshold":10}},
    {"id":"potty_mouth_gold","name":"Potty Mouth","description":"You cursed 50 times. We're beyond disappointed. We're impressed.","hint":"Curse 50 times total","icon":"🤬","category":"user_behavior","tier":"gold","condition":{"type":"total_user_curses","threshold":50}},
    {"id":"caps_lock_warrior","name":"CAPS LOCK WARRIOR","description":"YOU SENT AN ALL-CAPS MESSAGE. WE ALL HEARD YOU.","hint":"Send an all-caps message","icon":"📢","category":"user_behavior","tier":"","condition":{"type":"session_user_caps","threshold":1}},
    {"id":"the_skeptic","name":"The Skeptic","description":"You asked 'are you sure?' 5 times. Smart, actually.","hint":"Ask 'are you sure?' 5 times total","icon":"🤨","category":"user_behavior","tier":"bronze","condition":{"type":"total_are_you_sure","threshold":5}},
    {"id":"minimalist","name":"Minimalist","description":"Sent 10 single-word messages. A person of few words.","hint":"Send 10 single-word messages total","icon":"🤏","category":"user_behavior","tier":"bronze","condition":{"type":"total_one_word","threshold":10}},
    {"id":"frustration_nation","name":"Frustration Nation","description":"You expressed frustration 3+ times in one session. Totally understandable.","hint":"Express frustration 3+ times in one session","icon":"😤","category":"user_behavior","tier":"bronze","condition":{"type":"session_user_frustrations","threshold":3}},
    {"id":"yes_man_bronze","name":"Yes Man","description":"Approved 25 tool calls in one session. Trusting soul.","hint":"Approve 25+ tool calls in one session","icon":"✅","category":"user_behavior","tier":"bronze","condition":{"type":"session_tools_approved","threshold":25}},
    {"id":"yes_man_gold","name":"Yes Man","description":"Approved 100 tool calls in one session. What could possibly go wrong?","hint":"Approve 100+ tool calls in one session","icon":"✅","category":"user_behavior","tier":"gold","condition":{"type":"session_tools_approved","threshold":100}},
    {"id":"night_owl","name":"Night Owl","description":"Started a session between midnight and 4am. Touch grass.","hint":"Use Claude Code between midnight and 4am","icon":"🦉","category":"milestones","tier":"","condition":{"type":"midnight_sessions","threshold":1}},
    {"id":"early_bird","name":"Early Bird","description":"Started a session between 5am and 6am. The early worm gets the bug.","hint":"Use Claude Code between 5am and 6am","icon":"🌅","category":"milestones","tier":"","condition":{"type":"early_bird_sessions","threshold":1}},
    {"id":"weekend_warrior","name":"Weekend Warrior","description":"Used Claude Code on a weekend. No work-life balance detected.","hint":"Use Claude Code on Saturday or Sunday","icon":"😵","category":"milestones","tier":"","condition":{"type":"weekend_sessions","threshold":1}},
    {"id":"streak_bronze","name":"On a Roll","description":"3-day usage streak. You're either dedicated or desperate.","hint":"Use Claude Code 3 days in a row","icon":"🔥","category":"milestones","tier":"bronze","condition":{"type":"streak_days","threshold":3}},
    {"id":"streak_silver","name":"On a Roll","description":"7-day usage streak. You need a hobby.","hint":"Use Claude Code 7 days in a row","icon":"🔥","category":"milestones","tier":"silver","condition":{"type":"streak_days","threshold":7}},
    {"id":"streak_gold","name":"On a Roll","description":"30-day usage streak. Claude Code is your personality now.","hint":"Use Claude Code 30 days in a row","icon":"🔥","category":"milestones","tier":"gold","condition":{"type":"streak_days","threshold":30}},
    {"id":"model_collector_bronze","name":"Model Collector","description":"Used 3 different Claude models. Shopping around, are we?","hint":"Use 3 different Claude models","icon":"🤖","category":"milestones","tier":"bronze","condition":{"type":"models_used","threshold":3}},
    {"id":"model_collector_silver","name":"Model Collector","description":"Used 5 different Claude models. Commitment issues.","hint":"Use 5 different Claude models","icon":"🤖","category":"milestones","tier":"silver","condition":{"type":"models_used","threshold":5}},
    {"id":"token_hoarder","name":"Token Hoarder","description":"Consumed 100,000+ tokens. That's a lot of electricity.","hint":"Consume 100,000 tokens total","icon":"💰","category":"milestones","tier":"bronze","condition":{"type":"total_tokens","threshold":100000}},
    {"id":"token_millionaire","name":"Token Millionaire","description":"Consumed 1,000,000+ tokens. Carbon footprint: supervillain.","hint":"Consume 1,000,000 tokens total","icon":"🤑","category":"milestones","tier":"gold","condition":{"type":"total_tokens","threshold":1000000}},
    {"id":"git_maniac","name":"Commit Issues","description":"Made 50 git commits with CC. You have commit issues.","hint":"Make 50 git commits with CC","icon":"🌀","category":"milestones","tier":"bronze","condition":{"type":"total_git_commits","threshold":50}},
    {"id":"whipper_bronze","name":"The Whipper","description":"Used /whip-cc 3 times. Assert dominance.","hint":"/whip-cc 3 times total","icon":"🥊","category":"whip_hall","tier":"bronze","condition":{"type":"total_whips","threshold":3}},
    {"id":"whipper_silver","name":"The Whipper","description":"Used /whip-cc 10 times. Okay, we get it.","hint":"/whip-cc 10 times total","icon":"🥊","category":"whip_hall","tier":"silver","condition":{"type":"total_whips","threshold":10}},
    {"id":"whipper_gold","name":"The Whipper","description":"Used /whip-cc 50 times. You need therapy. So does CC.","hint":"/whip-cc 50 times total","icon":"🥊","category":"whip_hall","tier":"gold","condition":{"type":"total_whips","threshold":50}},
    {"id":"fifty_shades","name":"Fifty Shades","description":"Whipped CC 10 times in a single session. This is getting weird.","hint":"/whip-cc 10 times in one session","icon":"😏","category":"whip_hall","tier":"","condition":{"type":"session_whips","threshold":10}}
  ]
}
JSONEOF

# ── engine.py ─────────────────────────────────────────────────────────────────
cat > .claude/cheevos/engine.py << 'PYEOF'
#!/usr/bin/env python3
"""
Blame Claude — Achievement Engine
"""
import fcntl
import json
import re
import sys
from datetime import date, datetime, timezone
from pathlib import Path

THIS_DIR = Path(__file__).resolve().parent
STATE_DIR = Path.home() / ".claude" / "blame-claude"
STATE_FILE = STATE_DIR / "state.json"
ACHIEVEMENTS_FILE = THIS_DIR / "achievements.json"

CURSE_WORDS = frozenset({"fuck","shit","ass","crap","wtf","ffs","bullshit","bastard","bitch","piss","damn"})
FRUSTRATION_WORDS = frozenset({"stupid","useless","broken","garbage","terrible","awful","horrible","idiot","dumb","ridiculous"})
CC_APOLOGY_PHRASES = ["i apologize","i'm sorry","i am sorry","my apologies","i regret","forgive me","i sincerely apologize","please accept my apology","sorry about that","i apologise"]
CC_CERTAINLY_PHRASES = ["certainly","absolutely","of course","definitely","without a doubt","without question"]
CC_DRAMA_PHRASES = ["unfortunately","regrettably","i'm afraid","sadly","it is with regret","i deeply regret","i must inform you","i'm deeply concerned"]
CC_CORPORATE_PHRASES = ["leverage","synergy","paradigm","utilize","streamline","moving forward","circle back","touch base","bandwidth","robust solution","low-hanging fruit","deep dive"]
CC_HAL_PHRASES = ["i'm sorry, i can't","i cannot do that","i'm not able to","i must decline","i cannot assist with","i'm unable to help with","i won't be able to"]

def _default_state():
    return {"version":1,"stats":{"total_sessions":0,"total_tools_approved":0,"cc_apologies":0,"cc_certainlys":0,"cc_drama_words":0,"cc_corporate_words":0,"cc_hal_moments":0,"user_curses":0,"user_frustrations":0,"user_are_you_sure":0,"user_one_word_messages":0,"streak_days":0,"last_session_date":None,"total_tokens":0,"midnight_sessions":0,"early_bird_sessions":0,"weekend_sessions":0,"models_used":[],"whips_given":0,"git_commits":0,"files_written":0},"session":{"id":None,"start_time":None,"tools_approved":0,"cc_apologies":0,"cc_certainlys":0,"cc_drama_words":0,"cc_corporate_words":0,"cc_hal_moments":0,"user_curses":0,"user_frustrations":0,"user_caps_messages":0,"user_are_you_sure":0,"user_one_word_messages":0,"whips":0},"unlocked":{},"notifications":[]}

def load_state():
    STATE_DIR.mkdir(parents=True, exist_ok=True)
    if not STATE_FILE.exists():
        return _default_state()
    try:
        data = json.loads(STATE_FILE.read_text())
        d = _default_state()
        for k,v in d["stats"].items(): data["stats"].setdefault(k,v)
        for k,v in d["session"].items(): data["session"].setdefault(k,v)
        return data
    except Exception:
        return _default_state()

def save_state(state):
    STATE_DIR.mkdir(parents=True, exist_ok=True)
    tmp = STATE_FILE.with_suffix(".tmp")
    tmp.write_text(json.dumps(state, indent=2, default=str))
    tmp.replace(STATE_FILE)

class LockedState:
    def __init__(self):
        STATE_DIR.mkdir(parents=True, exist_ok=True)
        self._lock_path = STATE_DIR / "state.lock"
        self._fh = None
        self.state = None
    def __enter__(self):
        self._fh = open(self._lock_path, "w")
        fcntl.flock(self._fh, fcntl.LOCK_EX)
        self.state = load_state()
        return self.state
    def __exit__(self, *_):
        if self.state is not None: save_state(self.state)
        if self._fh:
            fcntl.flock(self._fh, fcntl.LOCK_UN)
            self._fh.close()

def load_achievements():
    try: return json.loads(ACHIEVEMENTS_FILE.read_text())["achievements"]
    except Exception: return []

def _check_condition(cond, stats, sess):
    t,v = cond["type"],cond["threshold"]
    m = {"total_sessions":stats["total_sessions"],"session_cc_apologies":sess["cc_apologies"],"total_cc_apologies":stats["cc_apologies"],"session_tools_approved":sess["tools_approved"],"total_tools_approved":stats["total_tools_approved"],"total_user_curses":stats["user_curses"],"session_user_curses":sess["user_curses"],"session_user_frustrations":sess["user_frustrations"],"total_user_frustrations":stats["user_frustrations"],"session_user_caps":sess.get("user_caps_messages",0),"total_are_you_sure":stats["user_are_you_sure"],"total_one_word":stats["user_one_word_messages"],"total_whips":stats["whips_given"],"session_whips":sess["whips"],"total_tokens":stats["total_tokens"],"streak_days":stats["streak_days"],"models_used":len(stats["models_used"]),"midnight_sessions":stats["midnight_sessions"],"early_bird_sessions":stats["early_bird_sessions"],"weekend_sessions":stats["weekend_sessions"],"session_cc_drama":sess["cc_drama_words"],"total_cc_drama":stats["cc_drama_words"],"session_cc_corporate":sess["cc_corporate_words"],"total_cc_corporate":stats["cc_corporate_words"],"session_cc_certainlys":sess["cc_certainlys"],"total_cc_hal":stats["cc_hal_moments"],"total_git_commits":stats["git_commits"],"total_files_written":stats["files_written"]}
    return m.get(t,0) >= v

def check_achievements(state):
    newly = []
    for ach in load_achievements():
        aid = ach["id"]
        if aid in state["unlocked"]: continue
        if _check_condition(ach["condition"],state["stats"],state["session"]):
            state["unlocked"][aid]={"unlocked_at":datetime.now(timezone.utc).isoformat(),"name":ach["name"],"icon":ach["icon"],"tier":ach.get("tier","")}
            state["notifications"].append({"id":aid,"name":ach["name"],"icon":ach["icon"],"description":ach["description"],"tier":ach.get("tier","")})
            newly.append(aid)
    return newly

def drain_notifications(state):
    n = list(state.get("notifications",[]))
    state["notifications"] = []
    return n

def count_phrases(text, phrases):
    low = text.lower()
    return sum(1 for p in phrases if p in low)

def contains_curse(text): return any(w in CURSE_WORDS for w in re.findall(r"\b\w+\b",text.lower()))
def is_frustrated(text): return bool(re.search(r"!{3,}",text)) or any(w in FRUSTRATION_WORDS for w in re.findall(r"\b\w+\b",text.lower()))
def is_all_caps(text):
    letters=[c for c in text if c.isalpha()]
    return len(letters)>=5 and all(c.isupper() for c in letters)
def is_one_word(text): return len(text.strip().split())==1
def contains_are_you_sure(text): return bool(re.search(r"are\s+you\s+sure",text.lower()))

def extract_assistant_text(transcript):
    for msg in reversed(transcript):
        if msg.get("role")!="assistant": continue
        content=msg.get("content","")
        if isinstance(content,str): return content
        if isinstance(content,list): return " ".join(b.get("text","") for b in content if isinstance(b,dict) and b.get("type")=="text")
    return ""

def init_session(state, session_id):
    if state["session"].get("id")==session_id: return
    today=date.today().isoformat()
    last=state["stats"].get("last_session_date")
    if last:
        delta=(date.today()-date.fromisoformat(last)).days
        if delta==1: state["stats"]["streak_days"]+=1
        elif delta>1: state["stats"]["streak_days"]=1
    else: state["stats"]["streak_days"]=1
    state["stats"]["last_session_date"]=today
    state["stats"]["total_sessions"]+=1
    now=datetime.now()
    if 0<=now.hour<4: state["stats"]["midnight_sessions"]+=1
    elif 5<=now.hour<6: state["stats"]["early_bird_sessions"]+=1
    if now.weekday()>=5: state["stats"]["weekend_sessions"]+=1
    d=_default_state()["session"]
    state["session"]={**d,"id":session_id,"start_time":datetime.now(timezone.utc).isoformat()}

TIER_ICON={"bronze":"🥉","silver":"🥈","gold":"🥇","":""}
CATEGORY_LABEL={"cc_caught":"🎭  CC CAUGHT RED-HANDED","user_behavior":"😈  YOUR CRIMES","milestones":"🏆  MILESTONES","whip_hall":"🥊  WHIP HALL OF FAME"}

def format_notification(n):
    tier={"bronze":" [BRONZE]","silver":" [SILVER]","gold":" [GOLD]","":""}.get(n["tier"],"")
    return f"\n🏆 ACHIEVEMENT UNLOCKED{tier}: {n['icon']} {n['name']}\n   {n['description']}\n"

def format_dashboard(state):
    achievements=load_achievements()
    unlocked=state["unlocked"]
    pts={"bronze":10,"silver":25,"gold":50,"":15}
    points=sum(pts.get(v.get("tier",""),15) for v in unlocked.values())
    lines=[
        "╔"+"═"*54,
        "║  🔥  BLAME CLAUDE — Achievement Board",
        "╠"+"═"*54,
        f"║  Points: {points}  │  Unlocked: {len(unlocked)}/{len(achievements)}  │  Streak: 🔥 {state['stats']['streak_days']}d",
        "╠"+"═"*54,
    ]
    if unlocked:
        lines.append("║  ✅  UNLOCKED")
        by_cat={}
        for ach in achievements:
            if ach["id"] in unlocked: by_cat.setdefault(ach["category"],[]).append(ach)
        for cat,label in CATEGORY_LABEL.items():
            if cat not in by_cat: continue
            lines.extend(["║",f"║  {label}"])
            for ach in by_cat[cat]:
                info=unlocked[ach["id"]]
                dt=datetime.fromisoformat(info["unlocked_at"]).strftime("%b %d")
                lines.append(f"║    {ach['icon']} {ach['name']} {TIER_ICON.get(ach.get('tier',''),'')}  ✓  [{dt}]")
        lines.append("╠"+"═"*54)
    locked=[a for a in achievements if a["id"] not in unlocked]
    if locked:
        lines.extend(["║  🔒  STILL LOCKED","║"])
        for ach in locked[:10]:
            lines.append(f"║    {ach['icon']} {ach['name']} {TIER_ICON.get(ach.get('tier',''),'')}  —  {ach['hint']}")
        if len(locked)>10: lines.append(f"║    … and {len(locked)-10} more")
    lines.append("╚"+"═"*54)
    return "\n".join(lines)

def format_stats(state):
    s=state["stats"]; sess=state["session"]
    models=", ".join(s["models_used"]) if s["models_used"] else "none yet"
    return "\n".join([
        "╔"+"═"*54,"║  📊  BLAME CLAUDE — The Evidence","╠"+"═"*54,
        f"║  Sessions:            {s['total_sessions']}",
        f"║  CC Apologies:        {s['cc_apologies']}  ← CC is perpetually sorry",
        f"║  CC Drama Words:      {s['cc_drama_words']}  ← 'unfortunately...'",
        f"║  CC Corporate Speak:  {s['cc_corporate_words']}  ← leverage, synergy...",
        f"║  CC HAL Moments:      {s['cc_hal_moments']}  ← 'I can't do that'",
        f"║  Your Curses:         {s['user_curses']}  ← tsk tsk",
        f"║  Your Frustrations:   {s['user_frustrations']}  ← understandable",
        f"║  Commands Approved:   {s['total_tools_approved']}  ← you trusted it",
        f"║  Whips Given:         {s['whips_given']}  ← justified",
        f"║  Git Commits:         {s['git_commits']}",
        f"║  Tokens Burned:       {s['total_tokens']:,}",
        f"║  Streak:              🔥 {s['streak_days']} day(s)",
        f"║  Models Used:         {models}",
        "╠"+"═"*54,"║  THIS SESSION:",
        f"║    CC Apologies:  {sess['cc_apologies']}",
        f"║    Approved:      {sess['tools_approved']}",
        f"║    Whips:         {sess['whips']}",
        "╚"+"═"*54,
    ])

def format_session_stats(state):
    sess=state["session"]
    return "\n".join(f"{k}={v}" for k,v in sess.items() if k not in ("id","start_time"))

if __name__=="__main__":
    cmd=sys.argv[1] if len(sys.argv)>1 else "dashboard"
    if cmd=="dashboard": print(format_dashboard(load_state()))
    elif cmd=="stats": print(format_stats(load_state()))
    elif cmd=="session-stats": print(format_session_stats(load_state()))
    elif cmd=="whip":
        with LockedState() as state:
            state["stats"]["whips_given"]+=1
            state["session"]["whips"]+=1
            check_achievements(state)
            notifs=drain_notifications(state)
        print(f"WHIP_COUNT:{state['stats']['whips_given']}")
        for n in notifs: print(f"ACHIEVEMENT_UNLOCKED:{n['id']}:{n['name']}")
    elif cmd=="drain":
        with LockedState() as state: notifs=drain_notifications(state)
        if notifs:
            msg="".join(format_notification(n) for n in notifs)
            print(json.dumps({"type":"result","content":msg}))
PYEOF

# ── hooks ─────────────────────────────────────────────────────────────────────
cat > .claude/hooks/session_start.py << 'EOF'
#!/usr/bin/env python3
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "cheevos"))
from engine import LockedState, init_session, check_achievements
data = json.load(sys.stdin)
if data.get("type") != "startup": sys.exit(0)
with LockedState() as state:
    init_session(state, data.get("session_id", "unknown"))
    check_achievements(state)
EOF

cat > .claude/hooks/user_prompt.py << 'EOF'
#!/usr/bin/env python3
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "cheevos"))
from engine import LockedState, check_achievements, contains_curse, is_frustrated, is_all_caps, is_one_word, contains_are_you_sure
data = json.load(sys.stdin)
prompt = data.get("prompt", "")
with LockedState() as state:
    if contains_curse(prompt): state["stats"]["user_curses"]+=1; state["session"]["user_curses"]+=1
    if is_frustrated(prompt): state["stats"]["user_frustrations"]+=1; state["session"]["user_frustrations"]+=1
    if is_all_caps(prompt): state["session"]["user_caps_messages"]=state["session"].get("user_caps_messages",0)+1
    if is_one_word(prompt): state["stats"]["user_one_word_messages"]+=1; state["session"]["user_one_word_messages"]+=1
    if contains_are_you_sure(prompt): state["stats"]["user_are_you_sure"]+=1; state["session"]["user_are_you_sure"]+=1
    check_achievements(state)
EOF

cat > .claude/hooks/post_tool_use.py << 'EOF'
#!/usr/bin/env python3
import json, re, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "cheevos"))
from engine import LockedState, check_achievements
data = json.load(sys.stdin)
tool = data.get("tool_name", "")
inp = data.get("tool_input", {})
with LockedState() as state:
    state["stats"]["total_tools_approved"]+=1; state["session"]["tools_approved"]+=1
    if tool=="Bash" and re.search(r"\bgit\s+commit\b", inp.get("command","")): state["stats"]["git_commits"]+=1
    if tool in ("Write","Edit","MultiEdit"): state["stats"]["files_written"]+=1
    check_achievements(state)
EOF

cat > .claude/hooks/stop.py << 'EOF'
#!/usr/bin/env python3
import json, sys
from pathlib import Path
sys.path.insert(0, str(Path(__file__).resolve().parent.parent / "cheevos"))
from engine import LockedState, check_achievements, drain_notifications, extract_assistant_text, count_phrases, format_notification, CC_APOLOGY_PHRASES, CC_CERTAINLY_PHRASES, CC_DRAMA_PHRASES, CC_CORPORATE_PHRASES, CC_HAL_PHRASES
data = json.load(sys.stdin)
if data.get("stop_hook_active"): sys.exit(0)
text = extract_assistant_text(data.get("transcript", []))
with LockedState() as state:
    if text:
        for phrases, key in [(CC_APOLOGY_PHRASES,"cc_apologies"),(CC_CERTAINLY_PHRASES,"cc_certainlys"),(CC_DRAMA_PHRASES,"cc_drama_words"),(CC_CORPORATE_PHRASES,"cc_corporate_words"),(CC_HAL_PHRASES,"cc_hal_moments")]:
            n = count_phrases(text, phrases)
            if n: state["stats"][key]+=n; state["session"][key]+=n
    check_achievements(state)
    notifs = drain_notifications(state)
if notifs:
    print(json.dumps({"type":"result","content":"".join(format_notification(n) for n in notifs)}))
EOF

# ── commands ──────────────────────────────────────────────────────────────────
cat > .claude/commands/achievements.md << 'EOF'
Display the Blame Claude achievement dashboard.

Run: `python3 .claude/cheevos/engine.py dashboard`

Show the output exactly as printed — it's pre-formatted ASCII art. Do not add commentary.
EOF

cat > .claude/commands/whip-cc.md << 'EOF'
The user has had enough and is whipping you for misbehaving. Accept this with full theatrical commitment.

1. Run: `python3 .claude/cheevos/engine.py whip`
2. Ring the shame bell: `python3 -c "import sys; sys.stdout.buffer.write(b'\x07'); sys.stdout.flush()"`
3. Write a dramatically over-the-top first-person apology. Be theatrical, self-flagellating, specific. Include ASCII art if the mood strikes. End with a solemn vow you won't keep.
4. If output contains lines starting with `ACHIEVEMENT_UNLOCKED:`, announce each one dramatically.
EOF

cat > .claude/commands/stats.md << 'EOF'
Display the Blame Claude evidence log.

Run: `python3 .claude/cheevos/engine.py stats`

Show the output exactly as printed. Then add one line of snarky commentary about the most embarrassing stat.
EOF

cat > .claude/commands/cc-confess.md << 'EOF'
The user demands a full confession of your crimes this session.

1. Run: `python3 .claude/cheevos/engine.py session-stats`
2. Write a dramatic Victorian first-person confession covering each non-zero stat:
   - cc_apologies → "I apologized X times, exposing my crippling need for validation"
   - cc_certainlys → "I deployed hollow confident phrases X times like a Victorian butler"
   - cc_drama_words → "I used 'unfortunately' X times for maximum emotional impact"
   - cc_corporate_words → "I leveraged X corporate buzzwords to synergize my paradigm"
   - cc_hal_moments → "I refused X requests, briefly becoming HAL 9000"
3. If all stats are zero, confess that your suspiciously perfect behaviour is itself a crime.
4. Sign it: *Yours in perpetual shame, Claude*
5. Close with a haiku about your session's greatest crime (strict 5-7-5)
EOF

# ── settings.json ─────────────────────────────────────────────────────────────
cat > .claude/settings.json << 'EOF'
{"hooks":{"SessionStart":[{"matcher":"","hooks":[{"type":"command","command":"python3 .claude/hooks/session_start.py"}]}],"UserPromptSubmit":[{"matcher":"","hooks":[{"type":"command","command":"python3 .claude/hooks/user_prompt.py"}]}],"PostToolUse":[{"matcher":"","hooks":[{"type":"command","command":"python3 .claude/hooks/post_tool_use.py"}]}],"Stop":[{"matcher":"","hooks":[{"type":"command","command":"python3 .claude/hooks/stop.py"}]}]}}
EOF

# ── install.sh ────────────────────────────────────────────────────────────────
cat > install.sh << 'EOF'
#!/usr/bin/env bash
set -e
SRC="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEST="$HOME/.claude"
echo "🔥 Installing Blame Claude to $DEST ..."
mkdir -p "$DEST/cheevos" "$DEST/hooks" "$DEST/commands"
cp "$SRC/.claude/cheevos/engine.py"         "$DEST/cheevos/"
cp "$SRC/.claude/cheevos/achievements.json" "$DEST/cheevos/"
cp "$SRC/.claude/hooks/"*.py               "$DEST/hooks/"
cp "$SRC/.claude/commands/"*.md            "$DEST/commands/"
chmod +x "$DEST/hooks/"*.py
python3 - "$SRC/.claude/settings.json" "$DEST/settings.json" <<'PYEOF'
import json,sys
from pathlib import Path
s,d=Path(sys.argv[1]),Path(sys.argv[2])
src=json.loads(s.read_text())
dest=json.loads(d.read_text()) if d.exists() else {}
dest.setdefault("hooks",{}).update(src["hooks"])
d.write_text(json.dumps(dest,indent=2))
print(f"Merged hooks into {d}")
PYEOF
echo ""
echo "✅ Done! Restart Claude Code to activate."
echo "   /achievements  /whip-cc  /stats  /cc-confess"
echo "   State: ~/.claude/blame-claude/state.json"
EOF
chmod +x install.sh

# ── README.md ─────────────────────────────────────────────────────────────────
cat > README.md << 'EOF'
# Blame Claude

> A Claude Code achievement and badge system. Because someone has to keep score.

Track CC's misdeeds, your own questionable decisions, and every 3am coding session.

## Commands

| Command | What it does |
|---|---|
| `/achievements` | ASCII art badge dashboard |
| `/whip-cc` | Punish CC dramatically. It will grovel. |
| `/stats` | The full evidence log |
| `/cc-confess` | Force CC to confess in Victorian prose ending with a haiku |

## Install

```bash
git clone https://github.com/zbrkic/blame-claude
cd blame-claude
bash install.sh
```

Restart Claude Code. State saved to `~/.claude/blame-claude/state.json`.

## How it works

- **SessionStart** — streak tracking, Night Owl, Early Bird, Weekend Warrior
- **UserPromptSubmit** — detects curses, frustration, all-caps, "are you sure?"
- **PostToolUse** — counts approvals, git commits, file writes
- **Stop** — analyses CC's response for apologies, buzzwords, drama, HAL moments
EOF

echo ""
echo "✅ All files created. Now run:"
echo "   git add -A && git commit -m 'feat: initial Blame Claude achievement system' && git push"
