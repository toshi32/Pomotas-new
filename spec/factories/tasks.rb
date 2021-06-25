FactoryBot.define do
  factory :task do
    title { 'task' }
    content { 'task' }
    time_limit { '2021-07-07' }
    created_at { '2021-07-05'}
    status { 1 }
  end
  factory :task2, class: "Task" do
    title { 'task2' }
    content { 'task2' }
    time_limit { '2021-08-08' }
    created_at { '2021-07-15'}
    status { 0 }
  end
  factory :task3, class: "Task" do
    title { 'task3' }
    content { 'task3' }
    time_limit { '2021-09-09' }
    created_at { '2021-07-25'}
    status { 0 }
  end
end
