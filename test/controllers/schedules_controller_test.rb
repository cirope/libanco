require 'test_helper'

class SchedulesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @schedule = schedules :default

    login
  end

  test 'should get index' do
    get schedules_url
    assert_redirected_to "#{schedules_url}/#{I18n.l(Date.today, format: :calendar)}"
  end

  test 'should get index with date' do
    get "#{schedules_url}/#{I18n.l(Date.today, format: :calendar)}"
    assert_response :success
  end

  test 'should get new' do
    get new_schedule_url, xhr: true
    assert_response :success
  end

  test 'should create schedule' do
    assert_difference('Schedule.count') do
      post schedules_url, params: {
        schedule: {
          description: @schedule.description,
          scheduled_at: 1.day.from_now
        }
      },
      headers: { 'HTTP_REFERER': "#{schedules_url}/#{I18n.l(Date.today, format: :calendar)}" }
    end

    assert_redirected_to "#{schedules_url}/#{I18n.l(Date.today, format: :calendar)}"
  end

  test 'should get edit' do
    get edit_schedule_url(@schedule), xhr: true
    assert_response :success
  end

  test 'should update schedule' do
    patch schedule_url(@schedule), params: { schedule: { description: 'Updated value' } },
      headers: { 'HTTP_REFERER': "#{schedules_url}/#{I18n.l(Date.today, format: :calendar)}" }, xhr: true

    assert_response :success
  end
end
