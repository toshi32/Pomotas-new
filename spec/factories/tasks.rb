FactoryBot.define do
  factory :task do
    title { 'task' }
    content { 'task' }
    time_limit { '2021-07-07' }
  end
  factory :task2, class: "Task" do
    title { 'task2' }
    content { 'task2' }
    time_limit { '2021-08-08' }
  end
  factory :task3, class: "Task" do
    title { 'task3' }
    content { 'task3' }
    time_limit { '2021-09-09' }
  end
end
