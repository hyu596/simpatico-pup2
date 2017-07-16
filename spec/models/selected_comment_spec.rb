require 'spec_helper'

describe SelectedComment do
<<<<<<< HEAD
<<<<<<< HEAD
  describe "select comments from selected comments" do
    before :each do
      @comment1 = FactoryGirl.create(:selected_comment, :content => 'good dog')
      @comment2 = FactoryGirl.create(:selected_comment, :content => 'bad dog')
    end
    
    it "select a comment randomly from all selected comments" do
        chosen_comment = SelectedComment.find_randomly
        expect(@comment1.content == chosen_comment.content || @comment2.content == chosen_comment.content).to be true
    end
  end
=======
=======
>>>>>>> 5eee49e0d4ebe94e5c570a40b64d9b8e348bb131
    describe "find_randomly should return a random selected_comment" do
        before :each do 
            @comment1 = FactoryGirl.create(:selected_comment, :content => "comment1")
            @comment2 = FactoryGirl.create(:selected_comment, :content => "comment2")
            @comment3 = FactoryGirl.create(:selected_comment, :content => "comment3")
            @comment4 = FactoryGirl.create(:selected_comment, :content => "comment4")
            @all_comment = [@comment1, @comment2, @comment3, @comment4]
            @loop_time = 40
        end
        
        it "should return a random comment from existing comments" do
            @loop_time.times do
                comment = SelectedComment.find_randomly
                expect(@all_comment).to include comment
            end
        end
        
        it "should each random comment in fair amount of times" do
            expect_time = 1 / SelectedComment.count
            c1_times = 0
            c2_times = 0
            c3_times = 0
            c4_times = 0
            @loop_time.times do
                comment = SelectedComment.find_randomly
                case comment
                    when @comment1
                        c1_times += 1
                    when @comment2
                        c2_times += 1
                    when @comment3
                        c3_times += 1
                    when @comment4
                        c4_times += 1
                end
            end
            expect(c1_times / @loop_time).to be_within(0.1).of(expect_time)
            expect(c2_times / @loop_time).to be_within(0.1).of(expect_time)
            expect(c3_times / @loop_time).to be_within(0.1).of(expect_time)
            expect(c4_times / @loop_time).to be_within(0.1).of(expect_time)
        end
    end
    
    it "find_randomly should return nil if no selected_comment" do
        expect(SelectedComment.find_randomly).to eq nil
    end
<<<<<<< HEAD
>>>>>>> a4ac70bdc6ff7ed75fd8b1a4108e1383d1da6c1e
=======
>>>>>>> 5eee49e0d4ebe94e5c570a40b64d9b8e348bb131
end
