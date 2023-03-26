# AWS Reserved Instance Analyzer

A Python-based tool to analyze AWS Reserved Instance (RI) and Savings Plan utilization, identify coverage gaps, and recommend optimal commitment purchases for the next quarter.

## Features

- **RI Utilization Tracking**: Monitor current Reserved Instance usage and coverage percentages
- **Savings Plan Analysis**: Track Savings Plan utilization across EC2, Fargate, and Lambda
- **Coverage Gap Detection**: Identify On-Demand instances that could benefit from commitments
- **Usage Pattern Analysis**: Analyze 90-day historical usage to recommend optimal RI purchases
- **Cost Savings Estimation**: Calculate potential savings from recommended commitments
- **Team Notifications**: Send email alerts to development teams based on resource tags
- **Quarterly Recommendations**: Generate purchase recommendations for next quarter

## Architecture

```
┌─────────────────┐
│  AWS Account    │
│  - EC2          │
│  - RDS          │
│  - Cost Explorer│
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  RI Analyzer    │
│  - Fetch RIs    │
│  - Analyze Usage│
│  - Calculate    │
└────────┬────────┘
         │
         ▼
┌─────────────────┐
│  Reports        │
│  - CSV Export   │
│  - Email Alerts │
│  - Dashboards   │
└─────────────────┘
```

## Installation

```bash
# Clone repository
git clone https://github.com/rahulreddy0120/aws-reserved-instance-analyzer.git
cd aws-reserved-instance-analyzer

# Install dependencies
pip install -r requirements.txt

# Configure AWS credentials
aws configure
```

## Configuration

Create a `config.yaml` file:

```yaml
aws:
  regions:
    - us-east-1
    - us-west-2
  
analysis:
  lookback_days: 90
  coverage_threshold: 80  # Alert if coverage drops below this
  utilization_threshold: 75  # Alert if utilization drops below this

notifications:
  enabled: true
  smtp_host: smtp.gmail.com
  smtp_port: 587
  from_email: finops@company.com
  
tags:
  team_tag: Team
  environment_tag: Environment
```

## Usage

### Analyze Current RI Utilization

```bash
python ri_analyzer.py --mode utilization --output report.csv
```

### Generate Quarterly Recommendations

```bash
python ri_analyzer.py --mode recommendations --quarter Q2-2026
```

### Send Team Notifications

```bash
python ri_analyzer.py --mode notify --teams engineering,platform
```

### Full Analysis

```bash
python ri_analyzer.py --mode full --output-dir ./reports
```

## Output Examples

### Utilization Report
```
Reserved Instance Utilization Report
Generated: 2026-02-22

Total Active RIs: 45
Average Utilization: 87.3%
Coverage: 82.1%

Top Underutilized RIs:
- m5.2xlarge (us-east-1): 45% utilized
- r5.xlarge (us-west-2): 62% utilized

Potential Savings: $12,450/month
```

### Recommendation Report
```
Q2 2026 Purchase Recommendations

Based on 90-day usage analysis:

High Priority:
- m5.large (us-east-1): 15 instances → $8,200/year savings
- t3.medium (us-west-2): 8 instances → $2,100/year savings

Medium Priority:
- r5.xlarge (us-east-1): 5 instances → $3,500/year savings

Total Estimated Savings: $13,800/year
```

## Metrics Tracked

- **RI Utilization**: Percentage of purchased RI hours actually used
- **RI Coverage**: Percentage of total instance hours covered by RIs
- **On-Demand Spend**: Cost of instances running without commitments
- **Savings Opportunity**: Potential savings from optimal RI purchases
- **Commitment Waste**: Cost of unused RI capacity

## Email Notifications

The tool sends notifications to teams when:
- RI utilization drops below threshold (default: 75%)
- Coverage gaps exceed threshold (default: 20%)
- New purchase recommendations are available
- Quarterly review is due

## Scheduling

Run as a cron job for automated monitoring:

```bash
# Daily utilization check
0 8 * * * /usr/bin/python3 /path/to/ri_analyzer.py --mode utilization

# Weekly recommendations
0 9 * * 1 /usr/bin/python3 /path/to/ri_analyzer.py --mode recommendations

# Monthly team notifications
0 10 1 * * /usr/bin/python3 /path/to/ri_analyzer.py --mode notify
```

## AWS Permissions Required

```json
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Action": [
        "ce:GetReservationUtilization",
        "ce:GetReservationCoverage",
        "ce:GetReservationPurchaseRecommendation",
        "ce:GetCostAndUsage",
        "ec2:DescribeReservedInstances",
        "ec2:DescribeInstances",
        "rds:DescribeReservedDBInstances",
        "rds:DescribeDBInstances",
        "savingsplans:DescribeSavingsPlans",
        "savingsplans:DescribeSavingsPlansOfferingRates"
      ],
      "Resource": "*"
    }
  ]
}
```

## Real-World Impact

At my previous organization:
- Increased RI coverage from 65% to 90%
- Identified $400K in annual savings opportunities
- Reduced RI waste by 40% through better utilization tracking
- Automated quarterly planning process, saving 20 hours/month

## Contributing

Contributions welcome! Please open an issue or submit a PR.

## License

MIT License

## Author

Rahul Reddy  
Cloud FinOps Engineer  
[LinkedIn](https://www.linkedin.com/in/rahul-7947/) | [GitHub](https://github.com/rahulreddy0120)









<!-- updated: 2023-01-12 -->

<!-- updated: 2023-03-28 -->

<!-- updated: 2023-06-15 -->

<!-- updated: 2023-09-04 -->

<!-- updated: 2023-11-20 -->

<!-- updated: 2024-02-07 -->

<!-- updated: 2024-05-23 -->

<!-- updated: 2024-08-10 -->

<!-- updated: 2024-11-28 -->

<!-- updated: 2025-01-15 -->

<!-- updated: 2025-04-30 -->

<!-- updated: 2025-07-22 -->

<!-- updated: 2025-10-08 -->

<!-- 2022-02-17T14:45:00 -->

<!-- 2022-03-14T10:00:00 -->

<!-- 2022-04-25T15:15:00 -->

<!-- 2022-06-08T11:30:00 -->

<!-- 2022-08-22T09:45:00 -->

<!-- 2022-10-10T14:00:00 -->

<!-- 2022-12-05T10:15:00 -->

<!-- 2023-02-20T15:30:00 -->

<!-- 2023-05-08T11:45:00 -->

<!-- 2023-07-24T09:00:00 -->

<!-- 2023-10-11T14:15:00 -->

<!-- 2024-01-03T10:30:00 -->

<!-- 2024-04-16T15:45:00 -->

<!-- 2024-07-01T11:00:00 -->

<!-- 2024-10-22T09:15:00 -->

<!-- 2025-01-14T14:30:00 -->

<!-- 2025-04-08T10:45:00 -->

<!-- 2025-08-19T16:00:00 -->

<!-- 2025-11-25T11:15:00 -->

<!-- 2022-02-17T14:45:00 -->

<!-- 2022-03-14T10:00:00 -->

<!-- 2022-04-25T15:15:00 -->

<!-- 2022-06-08T11:30:00 -->

<!-- 2022-08-22T09:45:00 -->

<!-- 2022-10-10T14:00:00 -->

<!-- 2022-12-05T10:15:00 -->

<!-- 2023-02-20T15:30:00 -->

<!-- 2023-05-08T11:45:00 -->

<!-- 2023-07-24T09:00:00 -->

<!-- 2023-10-11T14:15:00 -->

<!-- 2024-01-03T10:30:00 -->

<!-- 2024-04-16T15:45:00 -->

<!-- 2024-07-01T11:00:00 -->

<!-- 2024-10-22T09:15:00 -->

<!-- 2025-01-14T14:30:00 -->

<!-- 2025-04-08T10:45:00 -->

<!-- 2025-08-19T16:00:00 -->

<!-- 2025-11-25T11:15:00 -->

<!-- 2022-02-04T14:45:00 -->

<!-- 2022-02-17T10:00:00 -->

<!-- 2022-04-25T15:15:00 -->

<!-- 2022-08-22T09:45:00 -->

<!-- 2022-10-10T14:00:00 -->

<!-- 2023-03-20T15:30:00 -->

<!-- 2023-07-24T11:45:00 -->

<!-- 2023-07-25T09:00:00 -->

<!-- 2023-11-11T14:15:00 -->

<!-- 2024-04-16T10:30:00 -->

<!-- 2024-04-17T15:45:00 -->

<!-- 2024-09-22T11:00:00 -->

<!-- 2025-01-14T09:15:00 -->

<!-- 2025-06-08T14:30:00 -->

<!-- 2025-11-25T10:45:00 -->

<!-- 2022-01-26T14:45:00 -->

<!-- 2022-03-08T10:00:00 -->

<!-- 2022-05-24T15:15:00 -->

<!-- 2022-08-16T09:45:00 -->

<!-- 2022-11-22T14:00:00 -->

<!-- 2023-04-11T15:30:00 -->

<!-- 2023-08-08T11:45:00 -->

<!-- 2023-08-09T09:00:00 -->

<!-- 2023-12-27T14:15:00 -->

<!-- 2024-04-23T10:30:00 -->

<!-- 2024-04-24T15:45:00 -->

<!-- 2024-10-01T11:00:00 -->

<!-- 2025-03-18T09:15:00 -->

<!-- 2025-08-26T14:30:00 -->

<!-- 2025-12-09T10:45:00 -->

<!-- 2022-01-21T17:12:00 -->

<!-- 2022-01-22T14:31:00 -->

<!-- 2022-02-09T15:03:00 -->

<!-- 2022-02-24T16:27:00 -->

<!-- 2022-03-05T15:57:00 -->

<!-- 2022-03-09T15:28:00 -->

<!-- 2022-03-14T15:40:00 -->

<!-- 2022-05-24T14:46:00 -->

<!-- 2022-06-16T14:20:00 -->

<!-- 2022-08-09T13:10:00 -->

<!-- 2022-09-08T17:51:00 -->

<!-- 2022-09-22T08:54:00 -->

<!-- 2022-11-10T08:31:00 -->

<!-- 2022-11-15T10:31:00 -->

<!-- 2022-11-19T12:21:00 -->

<!-- 2023-01-05T09:47:00 -->

<!-- 2023-01-22T10:19:00 -->

<!-- 2023-02-19T15:07:00 -->

<!-- 2023-03-26T17:27:00 -->

<!-- 2023-05-10T12:44:00 -->

<!-- 2023-05-25T17:42:00 -->

<!-- 2023-06-28T14:17:00 -->

<!-- 2023-07-13T15:33:00 -->

<!-- 2023-09-26T12:28:00 -->

<!-- 2023-10-17T15:59:00 -->

<!-- 2023-11-07T09:17:00 -->

<!-- 2023-12-24T15:02:00 -->

<!-- 2024-02-26T10:11:00 -->

<!-- 2024-05-23T09:57:00 -->

<!-- 2024-06-19T09:58:00 -->

<!-- 2024-06-25T16:56:00 -->

<!-- 2024-07-05T12:58:00 -->

<!-- 2024-07-17T11:55:00 -->

<!-- 2024-12-19T10:34:00 -->

<!-- 2024-12-22T09:42:00 -->

<!-- 2024-12-29T12:03:00 -->

<!-- 2025-06-24T17:42:00 -->

<!-- 2025-07-28T10:48:00 -->

<!-- 2025-09-27T10:24:00 -->

<!-- 2025-11-22T09:32:00 -->

<!-- 2025-12-12T12:12:00 -->

<!-- 2026-03-19T08:15:00 -->

<!-- 2022-01-10T17:49:00 -->

<!-- 2022-01-16T12:12:00 -->

<!-- 2022-02-08T14:26:00 -->

<!-- 2022-02-14T10:23:00 -->

<!-- 2022-02-26T14:11:00 -->

<!-- 2022-03-23T08:25:00 -->

<!-- 2022-05-25T14:12:00 -->

<!-- 2022-06-22T17:02:00 -->

<!-- 2022-07-19T13:42:00 -->

<!-- 2022-08-09T10:53:00 -->

<!-- 2022-08-26T10:37:00 -->

<!-- 2022-10-06T10:41:00 -->

<!-- 2022-11-27T09:10:00 -->

<!-- 2022-12-24T09:41:00 -->

<!-- 2023-01-04T15:27:00 -->

<!-- 2023-01-24T13:45:00 -->

<!-- 2023-02-11T09:49:00 -->

<!-- 2023-03-21T15:47:00 -->

<!-- 2023-03-26T17:05:00 -->

<!-- 2023-09-14T11:21:00 -->

<!-- 2023-09-17T16:14:00 -->

<!-- 2023-10-04T17:00:00 -->

<!-- 2024-02-25T08:11:00 -->

<!-- 2024-10-07T13:36:00 -->

<!-- 2025-01-22T15:36:00 -->

<!-- 2025-07-10T17:52:00 -->

<!-- 2025-09-20T08:19:00 -->

<!-- 2025-10-15T08:40:00 -->

<!-- 2026-03-03T15:51:00 -->

<!-- 2026-03-05T11:08:00 -->

<!-- 2022-01-10T17:49:00 -->

<!-- 2022-01-16T12:12:00 -->

<!-- 2022-02-08T14:26:00 -->

<!-- 2022-02-14T10:23:00 -->

<!-- 2022-02-26T14:11:00 -->

<!-- 2022-03-23T08:25:00 -->

<!-- 2022-05-25T14:12:00 -->

<!-- 2022-06-22T17:02:00 -->

<!-- 2022-07-19T13:42:00 -->

<!-- 2022-08-09T10:53:00 -->

<!-- 2022-08-26T10:37:00 -->

<!-- 2022-10-06T10:41:00 -->

<!-- 2022-11-27T09:10:00 -->

<!-- 2022-12-24T09:41:00 -->

<!-- 2023-01-04T15:27:00 -->

<!-- 2023-01-24T13:45:00 -->

<!-- 2023-02-11T09:49:00 -->

<!-- 2023-03-21T15:47:00 -->

<!-- 2023-03-26T17:05:00 -->

<!-- 2023-09-14T11:21:00 -->

<!-- 2023-09-17T16:14:00 -->

<!-- 2023-10-04T17:00:00 -->

<!-- 2024-02-25T08:11:00 -->

<!-- 2024-10-07T13:36:00 -->

<!-- 2025-01-22T15:36:00 -->

<!-- 2025-07-10T17:52:00 -->

<!-- 2025-09-20T08:19:00 -->

<!-- 2025-10-15T08:40:00 -->

<!-- 2026-03-03T15:51:00 -->

<!-- 2026-03-05T11:08:00 -->

<!-- 2022-01-10T17:49:00 -->

<!-- 2022-01-16T12:12:00 -->

<!-- 2022-02-08T14:26:00 -->

<!-- 2022-02-14T10:23:00 -->

<!-- 2022-02-26T14:11:00 -->

<!-- 2022-03-23T08:25:00 -->

<!-- 2022-05-25T14:12:00 -->

<!-- 2022-06-22T17:02:00 -->

<!-- 2022-07-19T13:42:00 -->

<!-- 2022-08-09T10:53:00 -->

<!-- 2022-08-26T10:37:00 -->

<!-- 2022-10-06T10:41:00 -->

<!-- 2022-11-27T09:10:00 -->

<!-- 2022-12-24T09:41:00 -->

<!-- 2023-01-04T15:27:00 -->

<!-- 2023-01-24T13:45:00 -->

<!-- 2023-02-11T09:49:00 -->

<!-- 2023-03-21T15:47:00 -->

<!-- 2023-03-26T17:05:00 -->
