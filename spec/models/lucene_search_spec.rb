require 'rails_helper'

RSpec.describe LuceneSearch, :type => :model do

  describe "#test" do
    
    let(:str) { "I really like bananas, apples not so much" }
    
    context "with a valid query" do

      context "without opperations" do
        
        context "contains the term" do
          
          let(:search1) { LuceneSearch.new('bananas') }
          let(:search2) { LuceneSearch.new('apples') }
          let(:in_the_beggining) { LuceneSearch.new('I') }
          let(:in_the_end) { LuceneSearch.new('much') }

          it "returns true" do
            expect(search1.test(str)).to be
            expect(search2.test(str)).to be
            expect(in_the_beggining.test(str)).to be
            expect(in_the_end.test(str)).to be
          end

        end

        context "DO NOT contains the term" do

          let(:search1) { LuceneSearch.new('onions') }
          let(:search2) { LuceneSearch.new('garlic') }

          it "returns false" do
            expect(search1.test(str)).not_to be
            expect(search2.test(str)).not_to be
          end

        end

        context "* (asterisk)" do

	        context "starting with anything" do
	          
	          let(:without_asterisk) { LuceneSearch.new('nanas') }
	          let(:with_asterisk_before) { LuceneSearch.new('*nanas') }

	          it "returns true" do
	            expect(without_asterisk.test(str)).not_to be
	            expect(with_asterisk_before.test(str)).to be
	          end

	        end

	        context "ending with anything" do
	          
	          let(:without_asterisk) { LuceneSearch.new('bana') }
	          let(:with_asterisk_before) { LuceneSearch.new('bana*') }

	          it "returns true" do
	            expect(without_asterisk.test(str)).not_to be
	            expect(with_asterisk_before.test(str)).to be
	          end

	        end

	        context "starting and ending with anything" do
	          
	          let(:without_asterisk) { LuceneSearch.new('bana') }
	          let(:with_asterisk_before) { LuceneSearch.new('*anan*') }

	          it "returns true" do
	            expect(without_asterisk.test(str)).not_to be
	            expect(with_asterisk_before.test(str)).to be
	          end

	        end

	        context "anything in the middle" do
	          
	          let(:without_asterisk) { LuceneSearch.new('banas') }
	          let(:with_asterisk_before) { LuceneSearch.new('ba*nas') }

	          it "returns true" do
	            expect(without_asterisk.test(str)).not_to be
	            expect(with_asterisk_before.test(str)).to be
	          end

	        end

	      end

	      context "with quotes" do
	      	
	      	let(:search1) { LuceneSearch.new('"not much"') }
	        let(:search2) { LuceneSearch.new('"not so much"') }

	        it "returns true" do
	          expect(search1.test(str)).not_to be
	          expect(search2.test(str)).to be
	         end

	      end

      end
      
      context "AND" do

        context "contains all terms" do
          
          let(:search1) { LuceneSearch.new('bananas AND apples') }
          let(:search2) { LuceneSearch.new('bananas AND apples AND really') }

          it "returns true" do
            expect(search1.test(str)).to be
            expect(search2.test(str)).to be
          end

        end

        context "DO NOT contains all terms" do

          let(:search1) { LuceneSearch.new('bananas AND grappes') }
          let(:search2) { LuceneSearch.new('peach AND grappes') }
          let(:search3) { LuceneSearch.new('grappes AND bananas') }

          it "returns false" do
            expect(search1.test(str)).not_to be
            expect(search2.test(str)).not_to be
            expect(search3.test(str)).not_to be
          end

        end

      end

      context "OR" do
        
        context "DO NOT contains all terms" do

          let(:search) { LuceneSearch.new('peach OR grappes') }

          it "returns false" do
            expect(search.test(str)).not_to be
          end

        end

        context "contains at least one of the terms" do
      
          let(:search1) { LuceneSearch.new('bananas OR grappes') }
          let(:search2) { LuceneSearch.new('grappes OR bananas') }
          let(:search3) { LuceneSearch.new('bananas OR apples') }
          let(:search4) { LuceneSearch.new('grappes OR onions OR really') }

          it "returns true" do
            expect(search1.test(str)).to be
            expect(search2.test(str)).to be
            expect(search3.test(str)).to be
            expect(search3.test(str)).to be
          end

        end

        context "AND" do

          let(:search1) { LuceneSearch.new('grappes AND onions OR really') }
          let(:search2) { LuceneSearch.new('grappes OR onions AND really') }

          it "returns true" do
            expect(search1.test(str)).to be
          end


          it "returns false" do
            expect(search2.test(str)).not_to be
          end

        end

      end

      context "- (not)" do
      end

      context "() (parentheses)" do
      end

    end

  end

end