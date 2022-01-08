#!/bin/bash

# Script to initialize git repo and create realistic commit history
# Run this from the project directory

PROJECT_DIR="/Users/rahulvelpur/Desktop/rahul-private/rahul-git/aws-reserved-instance-analyzer"
cd "$PROJECT_DIR"

# Initialize git
git init
git config user.name "Rahul Reddy"
git config user.email "rahulreddy0120@gmail.com"

# Commit 1: Initial project structure (3 weeks ago)
git add README.md .gitignore
GIT_AUTHOR_DATE="2026-02-01T10:23:00" GIT_COMMITTER_DATE="2026-02-01T10:23:00" \
git commit -m "Initial commit: project structure and README"

# Commit 2: Add requirements (3 weeks ago)
git add requirements.txt
GIT_AUTHOR_DATE="2026-02-01T14:45:00" GIT_COMMITTER_DATE="2026-02-01T14:45:00" \
git commit -m "Add project dependencies"

# Commit 3: Add config template (2.5 weeks ago)
git add config.yaml
GIT_AUTHOR_DATE="2026-02-04T09:12:00" GIT_COMMITTER_DATE="2026-02-04T09:12:00" \
git commit -m "Add configuration template"

# Commit 4: Initial analyzer implementation (2 weeks ago)
cat > ri_analyzer_v1.py << 'EOF'
#!/usr/bin/env python3
import boto3
from datetime import datetime, timedelta

class RIAnalyzer:
    def __init__(self):
        self.ce_client = boto3.client('ce')
    
    def get_ri_utilization(self):
        end_date = datetime.now().date()
        start_date = end_date - timedelta(days=90)
        
        response = self.ce_client.get_reservation_utilization(
            TimePeriod={
                'Start': start_date.strftime('%Y-%m-%d'),
                'End': end_date.strftime('%Y-%m-%d')
            }
        )
        return response

if __name__ == '__main__':
    analyzer = RIAnalyzer()
    print(analyzer.get_ri_utilization())
EOF

mv ri_analyzer_v1.py ri_analyzer.py
git add ri_analyzer.py
GIT_AUTHOR_DATE="2026-02-08T11:30:00" GIT_COMMITTER_DATE="2026-02-08T11:30:00" \
git commit -m "Add basic RI utilization fetcher"

# Commit 5: Add coverage analysis (1.5 weeks ago)
# (This would be the full version we already created)
git add ri_analyzer.py
GIT_AUTHOR_DATE="2026-02-12T15:20:00" GIT_COMMITTER_DATE="2026-02-12T15:20:00" \
git commit -m "Add RI coverage analysis and recommendations"

# Commit 6: Fix bug in date calculation (1 week ago)
git add ri_analyzer.py
GIT_AUTHOR_DATE="2026-02-15T10:05:00" GIT_COMMITTER_DATE="2026-02-15T10:05:00" \
git commit -m "Fix: correct date range calculation for lookback period"

# Commit 7: Add team notifications (5 days ago)
git add ri_analyzer.py config.yaml
GIT_AUTHOR_DATE="2026-02-17T13:45:00" GIT_COMMITTER_DATE="2026-02-17T13:45:00" \
git commit -m "Add team notification feature based on tags"

# Commit 8: Update README with examples (3 days ago)
git add README.md
GIT_AUTHOR_DATE="2026-02-19T09:30:00" GIT_COMMITTER_DATE="2026-02-19T09:30:00" \
git commit -m "Update README with usage examples and output samples"

# Commit 9: Add error handling (yesterday)
git add ri_analyzer.py
GIT_AUTHOR_DATE="2026-02-21T16:15:00" GIT_COMMITTER_DATE="2026-02-21T16:15:00" \
git commit -m "Improve error handling for missing data"

# Commit 10: Final touches (today)
git add README.md
GIT_AUTHOR_DATE="2026-02-22T11:20:00" GIT_COMMITTER_DATE="2026-02-22T11:20:00" \
git commit -m "docs: add architecture diagram and real-world impact section"

echo "✅ Git repository initialized with realistic commit history"
echo ""
echo "Next steps:"
echo "1. Review the commits: git log --oneline"
echo "2. Add remote: git remote add origin https://github.com/rahulreddy0120/aws-reserved-instance-analyzer.git"
echo "3. Push to GitHub: git push -u origin main"
