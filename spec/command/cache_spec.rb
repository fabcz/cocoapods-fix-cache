require File.expand_path('../../spec_helper', __FILE__)

module Pod
  describe Command::Cache do
    describe 'CLAide' do
      it 'registers it self' do
        Command.parse(%w{ cache }).should.be.instance_of Command::Cache
      end
    end
  end
end

