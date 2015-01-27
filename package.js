Package.describe({
  name: 'konecty:delayed-task',
  summary: 'Buffer tasks for a certain time',
  version: '1.0.0',
  git: 'https://github.com/Konecty/meteor-delayed-task'
});

Package.onUse(function(api) {
  api.versionsFrom('1.0.3.1');

  api.use('coffeescript');

  api.addFiles('konecty:delayed-task.coffee');

  api.export(['DelayedTask'], ['server', 'client']);
});