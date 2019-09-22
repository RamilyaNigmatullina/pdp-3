shared_context :when_time_is_frozen do
  let(:current_time) { Time.new(2019, 9, 5, 9, 0_0, 0_0).in_time_zone("Moscow") }

  before { Timecop.freeze(current_time) }

  after { Timecop.return }
end
