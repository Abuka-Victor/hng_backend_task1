const express = require('express');

const app = express();

app.get('/', (req, res) => {
  const { slack_name, track } = req.query;
  const weekday = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];
  const date = new Date();
  res.status(200).json({
    slack_name,
    current_day: weekday[date.getDay()],
    utc_time: date.toISOString(),
    track,
    github_file_url: 'https://github.com/Abuka-Victor/hng_backend_task1/app.js',
    github_repo_url: 'https://github.com/Abuka-Victor/hng_backend_task1',
    status_code: 200,
  });
});

app.listen(3000, () => {
  console.log('listening on port 3000');
});
