global class ScheduleLembreteVacinacao implements Schedulable
{
    global void execute(SchedulableContext sc)
    {
        BatchLembreteVacinacao b = new BatchLembreteVacinacao();
        database.executebatch(b);
    }
}