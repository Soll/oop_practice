class Notebook
	attr_accessor :notes_array

	def initialize
		@notes_array = Array.new
	end

	def add_note(note)
		@notes_array.push(note)
	end

	def clean
		@notes_array.clear
	end
end

class Note
	attr_accessor :text, :shared
	
	def initialize(text)
		@text = text
		@shared = false
	end

	def share(note)
		@note_dup = note.dup
		@note_dup.shared = true
		return @note_dup	
	end
end

class SharedNotebook < Notebook
	def add_note(note)
		@notes_array.push(note.share(note))
	end

	def count
		puts notes_array.size
	end
end

notebook1 = Notebook.new

note1 = Note.new("Some text for note 1")
note2 = Note.new("Some text for note 2")
note3 = Note.new("Some text for note 3")

notebook1.add_note(note1)
notebook1.add_note(note2)
notebook1.add_note(note3)

sharedbook1 = SharedNotebook.new

puts "-----------------Notebook class entries-----------------"

for sep_note in notebook1.notes_array
	puts sep_note.text
	puts sep_note.shared
end

for sep_note in notebook1.notes_array
	sharedbook1.add_note(sep_note)
end

puts "-----------------SharedNotebook class entries-----------------"

for sep_note in sharedbook1.notes_array
	puts sep_note.text
	puts sep_note.shared
end

puts "-----------------Notebook class entries. Verify SHARED attribute to be FALSE-----------------"

for sep_note in notebook1.notes_array
	puts sep_note.text
	puts sep_note.shared
end



	










