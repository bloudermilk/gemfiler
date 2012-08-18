require 'spec_helper'

describe Gemfiler::Cabinet do
  subject { Gemfiler::Cabinet.new('./spec/support/gemfiles/SampleGemfile') }

  context '.collect' do
    before(:each) { subject.collect }

    it 'retrieves all gems and stores them.' do
      subject.gems.should include({name: 'gemfiler'})
    end

    it 'retrieves gems with versions' do
      subject.gems.should include({name: 'rspec', version: '2.11'})
    end

    it 'retrieves gems within group blocks correctly' do
      subject.gems.should include({name: 'somegem', groups: ['test']})
    end

    it 'always puts a gem group into the plural key' do
      subject.gems.should include({name: 'somegemthesecond', groups: ['test2']})
    end
  end

  context 'bundler methods' do
    before(:each) { subject.collect }

    it 'enables gemspec' do
      subject.has_gemspec.should be_true
    end

    it 'can define a ruby version' do
      subject.ruby_version[:version].should eq('1.9.2')
    end

    it 'can define a ruby version w/ engine' do
      subject.ruby_version[:engine].should eq('jruby')
    end
  end
end