namespace :test do
  desc "Run all tests with verbose output"
  task :verbose => :environment do
    puts "🧪 Running all tests with verbose output..."
    system("rails test --verbose")
  end

  desc "Run tests with coverage report"
  task :coverage => :environment do
    puts "📊 Running tests with coverage report..."
    ENV['COVERAGE'] = 'true'
    system("rails test")
  end

  desc "Run only unit tests"
  task :units => :environment do
    puts "🔧 Running unit tests..."
    system("rails test test/models test/helpers test/lib")
  end

  desc "Run only integration tests"
  task :integration => :environment do
    puts "🔗 Running integration tests..."
    system("rails test test/integration")
  end

  desc "Run only system tests"
  task :system => :environment do
    puts "🖥️  Running system tests..."
    system("rails test:system")
  end

  desc "Run tests and show detailed results"
  task :detailed => :environment do
    puts "📝 Running detailed test suite..."
    puts "=" * 50
    puts "UNIT TESTS"
    puts "=" * 50
    system("rails test test/models test/helpers test/lib --verbose")
    
    puts "\n" + "=" * 50
    puts "INTEGRATION TESTS"
    puts "=" * 50
    system("rails test test/integration test/controllers --verbose")
    
    puts "\n" + "=" * 50
    puts "SYSTEM TESTS"
    puts "=" * 50
    system("rails test:system --verbose")
  end

  desc "Run tests in parallel"
  task :parallel => :environment do
    puts "⚡ Running tests in parallel..."
    system("rails test --parallel")
  end

  desc "Run quick tests (skip system tests)"
  task :quick => :environment do
    puts "🚀 Running quick test suite (skipping system tests)..."
    system("rails test test/models test/controllers test/helpers test/lib test/integration")
  end
end

desc "Run the complete test suite with summary"
task :test_all => :environment do
  puts "🎯 Running complete test suite..."
  puts "Starting at: #{Time.current}"
  start_time = Time.current
  
  result = system("rails test")
  
  end_time = Time.current
  duration = (end_time - start_time).round(2)
  
  puts "\n" + "=" * 50
  puts "TEST SUMMARY"
  puts "=" * 50
  puts "Started: #{start_time.strftime('%H:%M:%S')}"
  puts "Finished: #{end_time.strftime('%H:%M:%S')}"
  puts "Duration: #{duration} seconds"
  puts "Status: #{result ? '✅ PASSED' : '❌ FAILED'}"
  puts "=" * 50
end