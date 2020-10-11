import java.util.*;

String axiom = "A";                // Initial string
ArrayList<String> strings;         // Stores all iterations in the list
Hashtable<String, String> rules;   // Stores all rules in a dictionary
int maxIterations = 9;             // Axiom doesn't count as iteration



void setup()
{
  size(600, 400);
  strings = new ArrayList<String>();
  strings.add(axiom);
  rules = new Hashtable();
  RuleSet(0);
  textAlign(CENTER);
  for (int i = 0; i < maxIterations; i++)
  {
    strings.add(Iterate(strings.get(strings.size()-1)));
  }
}

void draw()
{
  background(0);
  for (int i = 0; i < strings.size(); i++)
  {
    fill(255);
    text(strings.get(i), width / 2, 20 * i + 20);
  }
  noLoop();
}

String Iterate(String input)
{
  String output = "";

  for (int c = 0; c < input.length(); c++)
  {
    String letter = "" + input.charAt(c);
    output += rules.get(letter);
  }
  return output;
}

void RuleSet(int ruleSet)
{
  switch(ruleSet)
  {
  case 0:
    rules.put("A", "AB");
    rules.put("B", "A");
    break;
  case 1:
    rules.put("A", "BC");
    rules.put("B", "A");
    rules.put("C", "CA");
    break;
  case 2:
    rules.put("A", "C");
    rules.put("C", "B");
    rules.put("B", "ABC");
  }
}
