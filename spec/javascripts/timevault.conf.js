module.exports = function(config) {
  config.set({
    basePath: '../..',

    frameworks: ['jasmine'],

    autoWatch: true,

    preprocessors: {
      '**/*.coffee': 'coffee'
    }, 

    files: [
      'http://timevault.dev/assets/application.js',
      'spec/javascripts/*.{js,coffee}',
      { pattern: 'app/assets/javascripts/**/*.{js,coffee}',
        watched: true,
        included: false,
        served: false }
    ]
  });
};
